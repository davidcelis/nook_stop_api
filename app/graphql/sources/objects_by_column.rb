class Sources::ObjectsByColumn < Sources::ObjectByColumn
  # Override the `fetch` method from `ObjectByColumn` to return a list of
  # objects instead of only one object.
  def fetch(values)
    records = model_class.where(column => values)

    values.map { |v| records.select { |r| r.public_send(column) == v } }
  end
end
