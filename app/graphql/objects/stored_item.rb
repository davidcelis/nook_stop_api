class Objects::StoredItem < Objects::BaseObject
  implements GraphQL::Types::Relay::Node

  description "An item in your storage."

  field :item, Unions::StorableItem, null: false, description: "The stored item."
  def item
    dataloader.with(Sources::ObjectByColumn, object["type"].constantize, :id).load(object["id"])
  end

  field :count, Integer, null: false, description: "The number of this item you have in storage.", hash_key: "count"
end
