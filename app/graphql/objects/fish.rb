class Objects::Fish < Objects::BaseObject
  implements GraphQL::Types::Relay::Node

  implements Interfaces::Creature

  description "Fish are caught by using a fishing rod and can be donated to Blathers for display in the Museum. Many fish can only be caught in certain places, at certain times, or under certain conditions."

  field :weather_conditions, Enums::Weather, description: "Weather conditions that must be met in order to catch this fish."
  field :difficulty_to_catch, Enums::CatchDifficulty, null: false, description: "How difficult it is to catch this fish."
  field :field_of_vision, Enums::FieldOfVision, null: false, description: "The fish's field of vision, which affects how easy it is for it to see the player's tackle when cast."
  field :shadow_size, Enums::ShadowSize, null: false, description: "The size of the visible shadow cast by the fish as it swims around."

  field :lighting_type, Enums::LightingType, description: "The type of light emitted by this item when placed."
end
