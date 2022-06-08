module Interfaces::Creature
  include Interfaces::BaseInterface

  description "Something in Animal Crossing that is considered a creature."

  # Core attributes
  field :name, String, null: false, description: "The name of this creature."
  field :description, String, null: false, description: "The description of this creature, courtesy of Blathers."
  field :catch_phrase, String, null: false, description: "The (more often than not) delightfully punny phrase uttered by the player when this creature is caught."
  field :resale_value, Integer, null: false, description: "The resale value of this item in Bells."
  field :image_url, Scalars::URL, null: false, description: "A URL pointing to an image of this creature as shown in the Critterpedia."

  # Attributes about how or where to catch the creature
  field :where_to_catch, String, null: false, description: "A description of where this creature can be found."
  field :spawn_rate, String, null: false, description: "The rate at which this creature spawns on the player's island."
  def spawn_rate
    [object.spawn_rate.min, object.spawn_rate.max].uniq.join("-")
  end

  field :total_catches_to_unlock, Integer, null: false, description: "The number of other creatures of the same type that the player must catch in their lifetime before this creature will spawn on their island."
  field :active_times, [Objects::ActiveCreatureMonth], null: false, description: "A list of months during which the creature can be caught on islands in the specified hemisphere." do
    argument :hemisphere, Enums::Hemisphere, required: true
  end
  def active_times(hemisphere:)
    object.active_times[hemisphere]
  end

  # Attributes related to placing the creature as "furniture"
  field :can_be_placed_outdoors, Boolean, null: false, description: "Whether or not this item can be placed outdoors."
  def can_be_placed_outdoors() true end

  field :is_a_surface, Boolean, null: false, description: "Whether or not this creature acts as a surface when placed as furniture, allowing Miscellaneous items and Photos to be placed on top of it."

  field :length, Float, null: false, description: "The length of this creature when placed as furniture, in grid blocks."
  field :width, Float, null: false, description: "The width of this creature when placed as furniture, in grid blocks."

  # Attributes related to Happy Home Academy assessments when placed as "furniture"
  field :hha_base_points, Integer, null: false, description: "The minimum number of points awarded by the Happy Home Academy for displaying this creature."
  field :hha_category, Enums::HHACategory, description: "A shared category of which this creature is a member, as determined by the Happy Home Academy."

  # Metadata
  field :added_in_version, Scalars::Version, null: false, description: "The version of Animal Crossing New Horizons in which this creature first appeared."
  field :internal_id, Integer, null: false, description: "A unique identifier for this creature that is internal to the game.", method: :unique_internal_id
end
