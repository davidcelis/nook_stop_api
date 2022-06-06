class ItemSerializer < Blueprinter::Base
  identifier :id do |item, _|
    item.shared_internal_id
  end

  fields *[
    # Core attributes
    :name,

    # Descriptive attributes
    :category,
    :tag,

    # Acquisition attributes
    :price,
    :resale_value,
    :alternative_currency,
    :alternative_price,
    :sources,
    :source_notes,
    :listed_in_catalog,
    :for_sale_in_catalog,
    :seasonal_event,
    :exclusive_to_seasonal_event,

    # Usage attributes
    :number_of_uses,
    :food_power,
    :stack_size,

    # Customization attributes
    :body_type,
    :body_customizable,
    :pattern_type,
    :pattern_customization_options,
    :customization_kit_type,
    :customization_kit_cost,
    :cyrus_customization_price,

    # Furniture placement attributes
    :length,
    :width,
    :can_be_placed_outdoors,
    :is_a_surface,
    :interactivity,
    :lighting_type,
    :speaker_type,
    :can_decorate_door,
    :ceiling_type,
    :curtain_type,
    :curtain_color,
    :window_type,
    :window_pane_type,
    :window_color,
    :rug_size,
    :visual_effects,

    # Clothing attributes
    :clothing_styles,
    :gender_presentation,
    :fashionable_for_season,
    :fashion_season_availability,
    :mannequin_season,
    :dress_up_shape,
    :gender_presentation_for_villagers,
    :hat_or_accessory_type,
    :label_themes,

    # Fossil/Artwork attributes
    :fossil_group,
    :museum_room,
    :artwork_title,
    :artwork_label,
    :artwork_category
  ]

  field :description, name: :museum_description

  fields *[
    :gyroid_sound_type,

    # Happy Home Association attributes
    :hha_base_points,
    :hha_category,
    :hha_concepts,
    :hha_series,
    :hha_set,

    # Metadata
    :added_in_version
  ]

  view :extended do
    association :variants, blueprint: ItemVariantSerializer
  end
end
