class Mutations::Purchase < Mutations::BaseMutation
  description "Purchases the specified item and puts it into your storage."

  argument :name, String, required: true, description: "The name of the desired item."
  argument :variant_id, String, required: false, description: "The ID of the variant you would like to purchase. Defaults to whichever variant is listed first when viewing the item."

  field :balance, Integer, null: false, description: "Your new account balance."
  field :storage, [Objects::StoredItem], null: false, description: "The new state of your storage."
  field :transaction_id, String, null: false, description: "A unique Transaction ID for your records. Consider this to be a kind of receipt."

  def resolve(name:, variant_id: nil)
    item = Item.find_by!(name: name)

    # Perform some quick price checks
    raise GraphQL::ExecutionError, "Sorry, but this item isn't for sale!" if item.price.blank?

    new_balance = context[:account][:bells] - item.price
    if new_balance < 0
      raise GraphQL::ExecutionError, "Oops! This item costs #{item.price} Bells but your account balance is #{context[:account][:bells]} Bells. You need to deposit #{-new_balance} Bells before purchasing this item."
    end

    variant = variant_id ? item.variants.find_by!(unique_internal_id: variant_id) : item.variants.first
    storage = JSON.parse(context[:account][:storage])

    if (stored_item = storage.find { |s| s["id"] == variant.id && s["type"] == "ItemVariant" })
      stored_item["count"] += 1
    else
      storage << {"id" => variant.id, "type" => "ItemVariant", "count" => 1}
    end

    context[:account][:storage] = storage.to_json
    context[:account][:bells] = new_balance

    OpenStruct.new(
      balance: context[:account][:bells],
      storage: storage,
      transaction_id: SecureRandom.uuid
    )
  end
end
