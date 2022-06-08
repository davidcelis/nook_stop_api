class Sources::ObjectByColumn < GraphQL::Dataloader::Source
  def initialize(model_class, column)
    @model_class = model_class
    @column = normalize_column(column)
  end

  def fetch(values)
    records = model_class.where(column => values)

    # return a list with `nil` for any ID that wasn't found
    values.map { |v| records.find { |r| r.public_send(column) == v } }
  end

  private

  attr_reader :model_class, :column

  def normalize_column(column)
    return column unless column == :internal_id

    return :shared_internal_id if model_class == Item
    return :unique_internal_id if model_class.in?(ItemVariant, Creature, Recipe)

    raise ArgumentError.new("Unsupported class used: #{model_class.name}")
  end
end
