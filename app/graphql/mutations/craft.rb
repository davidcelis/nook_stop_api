class Mutations::Craft < Mutations::BaseMutation
  description "Crafts the specified item using items from your storage, and places the newly crafted item back in your storage."

  argument :name, String, required: true, description: "The name of the item you'd like to craft."
  argument :variant_id, String, required: false, description: "If the item has variants, the ID of its variant you'd like to craft. Defaults to whichever variant is listed first when viewing the item."

  field :storage, Connections::StorageConnection, null: false, description: "The new state of your storage."

  def resolve(name:, variant_id: nil)
    item = Item.find_by(name: name)
    raise GraphQL::ExecutionError, "Item not found" if item.blank?

    recipe = Recipe.find_by(item_id: item)
    raise GraphQL::ExecutionError, "Oops, sorry! The item \"#{item.name}\" can't be crafted." if recipe.blank?

    variant = variant_id ? item.variants.find_by!(unique_internal_id: variant_id) : item.variants.first

    storage = JSON.parse(context[:account][:storage])
    insufficient_materials = []
    recipe.materials.includes(:item).each do |material|
      # Although many recipes call for "Items", we always store variants
      item = material.item
      target_type, target_id = [material.item_type, material.item_id]
      if material.item.is_a?(Item)
        target_type, target_id = ["ItemVariant", material.item.variants.first.id]
      end

      # Make sure we have sufficient materials
      stored_material = storage.find { |s| s["id"] == target_id && s["type"] == target_type }
      stored_material ||= { "count" => 0 }

      if stored_material["count"] < material["count"]
        item = material.item
        item = item.item if item.is_a?(ItemVariant)

        insufficient_materials << { "name" => item.name, "have" => stored_material["count"], "need" => material["count"] }
      else
        stored_material["count"] -= material.count
      end
    end

    if insufficient_materials.any?
      items = recipe.materials.map(&:item)
      raise GraphQL::ExecutionError.new("Oops, sorry! You have insufficient materials.", extensions: {
        "missing" => insufficient_materials
      })
    end

    if (stored_item = storage.find { |s| s["id"] == variant.id && s["type"] == "ItemVariant" })
      stored_item["count"] += 1
    else
      storage << { "id" => variant.id, "type" => "ItemVariant", "count" => 1 }
    end

    storage.delete_if { |s| s["count"] == 0 }

    context[:account][:storage] = storage.to_json

    OpenStruct.new(storage: storage)
  end
end
