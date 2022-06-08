class Sources::ItemVariantsByItemId < GraphQL::Dataloader::Source
  def fetch(item_ids)
    records = ItemVariant.where(item_id: item_ids)

    item_ids.map { |id| records.select { |r| r.item_id == id } }
  end
end
