class Edges::StoredItemEdge < Edges::BaseEdge
  node_type(Unions::StorableItem)

  def node
    dataloader.with(Sources::ObjectByColumn, stored_item["type"].constantize, :id).load(stored_item["id"])
  end

  field :count, Integer, null: false, description: "The number of this item you have in storage."
  def count
    stored_item["count"]
  end

  private

  def stored_item
    object.node
  end
end
