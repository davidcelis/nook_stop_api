class InsectSerializer < Blueprinter::Base
  identifier :id do |insect, _|
    insect.unique_internal_id
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
    :total_catches_to_unlock,
    :active_times
  ]

  field :spawn_rate do |insect, _|
    [insect.spawn_rate.min, insect.spawn_rate.max].uniq.join("-")
  end

  fields *[
    # Attributes related to placing it as furniture
    :length,
    :width,
    :is_a_surface,
    :colors,

    # Happy Home Association attributes
    :hha_base_points,
    :hha_category,

    # Metadata
    :added_in_version
  ]
end
