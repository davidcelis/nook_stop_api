class Objects::RecipeMaterial < Objects::BaseObject
  implements GraphQL::Types::Relay::Node

  description "Materials are consumed to craft an item using a DIY Recipe."

  field :item, Unions::RecipeMaterialItem, null: false, description: "The item used by the recipe."
  def item
    dataloader.with(Sources::ObjectByColumn, object.item_type.constantize, :id).load(object.item_id)
  end

  field :count, Integer, null: false, description: "The number of this item used by the recipe."
end
