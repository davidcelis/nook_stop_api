class Objects::Insect < Objects::BaseObject
  implements GraphQL::Types::Relay::Node

  implements Interfaces::Creature

  description "Insects are caught by using a bug net and can be donated to Blathers for display in the Museum. Many insects can only be caught in certain places, at certain times, or under certain conditions."

  field :weather_conditions, Enums::Weather, description: "Weather conditions that must be met in order to catch this insect."
end
