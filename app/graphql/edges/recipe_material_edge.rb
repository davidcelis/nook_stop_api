class Edges::RecipeMaterialEdge < Edges::BaseEdge
  node_type(Unions::RecipeMaterialItem)

  def node
    dataloader.with(Sources::ObjectByColumn, material.item_type.constantize, :id).load(material.item_id)
  end

  field :count, Integer, null: false, description: "The number of this material required by the recipe."
  def count
    material.count
  end

  private

  def material
    object.node
  end
end
