class Sources::ObjectByInternalId < GraphQL::Dataloader::Source
  def initialize(model_class)
    @model_class = model_class
  end

  def fetch(ids)
    column = if model_class == ::Item
      :shared_internal_id
    elsif model_class.in?(::ItemVariant, ::Creature, ::Recipe)
      :unique_internal_id
    end

    records = model_class.where(column => ids)

    # return a list with `nil` for any ID that wasn't found
    ids.map { |id| records.find { |r| r.public_send(column) == id } }
  end

  private

  attr_reader :model_class
end
