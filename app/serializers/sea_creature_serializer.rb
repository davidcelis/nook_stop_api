class SeaCreatureSerializer < Blueprinter::Base
  identifier :id do |sea_creature, _|
    sea_creature.unique_internal_id
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
    :shadow_size,
    :movement_speed,
    :total_catches_to_unlock,
    :active_times
  ]

  field :spawn_rate do |sea_creature, _|
    [sea_creature.spawn_rate.min, sea_creature.spawn_rate.max].uniq.join("-")
  end

  fields *[
    # Attributes related to placing it as furniture
    :length,
    :width,
    :is_a_surface,
    :colors,
    :lighting_type,

    # Happy Home Academy attributes
    :hha_base_points,
    :hha_category,

    # Metadata
    :added_in_version
  ]
end
