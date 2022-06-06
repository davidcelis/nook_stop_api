class FishSerializer < Blueprinter::Base
  identifier :id do |fish, _|
    fish.unique_internal_id
  end

  fields *[
    # Core attributes
    :name,
    :description,
    :catch_phrase,
    :resale_value,
    :image_url,

    # How to catch it
    :where_to_catch,
    :weather_conditions,
    :difficulty_to_catch,
    :field_of_vision,
    :shadow_size,
    :total_catches_to_unlock,
    :active_times
  ]

  field :spawn_rate do |fish, _|
    [fish.spawn_rate.min, fish.spawn_rate.max].uniq.join("-")
  end

  fields *[
    # Attributes related to placing it as furniture
    :length,
    :width,
    :is_a_surface,
    :colors,
    :lighting_type,

    # Happy Home Association attributes
    :hha_base_points,
    :hha_category,

    # Metadata
    :added_in_version
  ]
end
