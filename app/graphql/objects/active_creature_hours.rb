class Objects::ActiveCreatureHours < Objects::BaseObject
  description "A structured representation of the hours during which a creature can be caught, as a range. If the `start` is greater than the `end` of this range, it means the range extends past the end of the day, wrapping back around through some number of hours following the beginning of the day."

  field :start, Integer, null: false, description: "The start of the time range, from `0` to `23`."
  def start
    object.first
  end

  field :end, Integer, null: false, description: "The end of the time range, from `0` to `23`.", resolver_method: :finish
  def finish
    object.last
  end
end
