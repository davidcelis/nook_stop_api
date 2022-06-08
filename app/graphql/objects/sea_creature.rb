class Objects::SeaCreature < Objects::BaseObject
  implements GraphQL::Types::Relay::Node

  implements Interfaces::Creature

  description "Sea Creatures are caught by diving into the ocean with a wetsuit equipped and they can be donated to Blathers for display in the Museum. Many sea creatures can only be caught at certain times."

  field :movement_speed, Enums::MovementSpeed, null: false, description: "The speed at which this sea creature moves along the sea bed."
  field :shadow_size, Enums::ShadowSize, null: false, description: "The size of the visible shadow cast by the sea creature as it moves around."
  field :lighting_type, Enums::LightingType, description: "The type of light emitted by this item when placed."
end
