module Interfaces::PlaceableItem
  include Interfaces::BaseInterface

  description "An item that can be placed on the ground (or some other horizontal surface) and act as furniture or decor."

  field :can_be_placed_outdoors, Boolean, null: false, description: "Whether or not this item can be placed outdoors."
  field :is_a_surface, Boolean, null: false, description: "Whether or not this item acts as a surface, allowing Miscellaneous items and Photos to be placed on top of it."

  field :interactivity, Enums::Interaction, description: "The type of interaction that this item allows when placed."
  field :lighting_type, Enums::LightingType, description: "The type of light emitted by this item when placed."
  field :speaker_type, Enums::SpeakerType, description: "The type of speaker that this item can act as when placed."

  field :length, Float, null: false, description: "The length of this item when placed, in grid blocks."
  field :width, Float, null: false, description: "The width of this item when placed, in grid blocks."
end
