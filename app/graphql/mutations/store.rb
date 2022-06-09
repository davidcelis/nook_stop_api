class Mutations::Store < Mutations::BaseMutation
  description "Puts the specified item or creature into your storage."

  argument :name, String, required: true, description: "The name of the item or creature."
  argument :variant_id, String, required: false, description: "If storing an item, the ID of its variant you're storing. Defaults to whichever variant is listed first when viewing the item."
  argument :count, Integer, required: false, description: "The number of this item you're putting into storage.", default_value: 1

  field :storage, Connections::StorageConnection, null: false, description: "The new state of your storage."
  field :transaction_id, String, null: false, description: "A unique Transaction ID for your records. Consider this to be a kind of receipt."

  def resolve(name:, count:, variant_id: nil)
    if (item = Item.find_by(name: name))
      item = variant_id ? item.variants.find_by!(unique_internal_id: variant_id) : item.variants.first
    end
    item ||= Creature.find_by(name: name)

    raise ActiveRecord::RecordNotFound if item.blank?

    storage = JSON.parse(context[:account][:storage])
    if (stored_item = storage.find { |s| s["id"] == item.id && s["type"] == item.class.name })
      stored_item["count"] += count
    else
      storage << {"id" => item.id, "type" => item.class.name, "count" => count}
    end

    context[:account][:storage] = storage.to_json

    OpenStruct.new(
      storage: storage,
      transaction_id: SecureRandom.uuid
    )
  end
end
