class Objects::ActiveCreatureMonth < Objects::BaseObject
  description "A structured representation of a month during which a creature can be caught, including the hours of day."

  field :month, Enums::Month, null: false, description: "One of the months during which the creature can be caught.", hash_key: "month"
  field :hours, Objects::ActiveCreatureHours, description: "The hours in this month during which the creature can be caught. If not present, the creature can be caught all day.", hash_key: "hours"
end
