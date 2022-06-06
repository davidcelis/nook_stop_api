class VillagerSerializer < Blueprinter::Base
  identifier :id

  fields *[
    # Core attributes
    :name,
    :species,
    :gender,
    :catchphrase
  ]

  field :birthday do |villager, options|
    [villager.birth_month, villager.birth_date].join("/")
  end

  fields *[
    :personality,
    :personality_type,

    # Favorite things
    :hobby,
    :styles,
    :colors,
    :favorite_saying
  ]

  fields *[
    :name_color,
    :speech_bubble_color,
    :icon_url,
    :image_url,
    :house_image_url,

    # Metadata
    :added_in_version
  ]

  # Possessions
  [
    :favorite_song,
    :default_top,
    :default_umbrella,
    :default_wallpaper,
    :default_flooring,
    :default_workbench,
    :default_kitchen_equipment
  ].each do |association|
    field association do |villager, options|
      default_item = DefaultItem.new(villager: villager, item: villager.public_send(association))

      DefaultItemSerializer.render_as_hash(default_item)
    end
  end

  view :extended do
    association :default_items, name: :default_furniture, blueprint: DefaultItemSerializer
  end
end
