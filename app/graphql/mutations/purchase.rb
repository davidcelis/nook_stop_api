class Mutations::Purchase < Mutations::BaseMutation
  description "Purchases the specified item and puts it into your storage."

  argument :name, String, required: true, description: "The name of the desired item."
  argument :variant_id, String, required: false, description: "The ID of the variant you would like to purchase. Defaults to whichever variant is listed first when viewing the item."

  object_class Objects::Transaction

  def resolve(name:, variant_id: nil)
    item = Item.find_by!(name: name)

    # Perform some quick price checks
    raise GraphQL::ExecutionError, "Sorry, but this item isn't for sale!" if item.price.blank?

    new_balance = context[:account][:bells] - item.price
    if new_balance < 0
      raise GraphQL::ExecutionError, "Oops! This item costs #{item.price} Bells but your account balance is #{context[:account][:bells]} Bells. You need to deposit #{-new_balance} Bells before purchasing this item."
    end

    variant = variant ? item.variants.find_by!(unique_internal_id: variant_id) : item.variants.first

    context[:account][:bells] = new_balance

    storage = JSON.parse(context[:account][:storage]).tap { |items| items << variant.id }
    context[:account][:storage] = JSON.generate(storage)

    OpenStruct.new(
      balance: context[:account][:bells],
      transaction_id: SecureRandom.uuid
    )
  end
end
