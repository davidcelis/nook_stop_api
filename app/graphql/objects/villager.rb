class Objects::Villager < Objects::BaseObject
  implements GraphQL::Types::Relay::Node

  description "Villagers are the animal friends who reside on the player's island."

  field :name, String, null: false, description: "The villager's given name."
  field :species, Enums::Species, null: false, description: "The villager's species of animal."
  field :gender, Enums::Gender, null: false, description: "The villager's gender."
  field :birth_month, Enums::Month, null: false, description: "The month during which the villager was born."
  field :birth_date, Integer, null: false, description: "The day of the month on which the villager was born."

  field :icon_url, Scalars::URL, null: false, description: "A URL pointing to an icon representing the villager."
  field :image_url, Scalars::URL, null: false, description: "A URL pointing to a photo of the villager."
  field :house_image_url, Scalars::URL, description: "A URL pointing to a photo of the villager's home."

  field :personality, Enums::Personality, null: false, description: "The kind of personality the villager has."
  field :personality_type, Enums::PersonalityType, null: false, description: "The personality type the villager has, as according to the Type A and Type B personality theory."
  field :catchphrase, String, null: false, description: "A phrase very frequently uttered by the villager as a sort of filler speech."
  field :hobby, Enums::Hobby, null: false, description: "The villager's main hobby."
  field :favorite_styles, [Enums::Style], null: false, description: "The villager's favorite clothing styles.", method: :styles
  field :favorite_colors, [String], null: false, description: "The villager's favorite colors.", method: :colors
  field :favorite_saying, String, null: false, description: "The villager's favorite phrase."

  field :name_color, String, null: false, description: "The color of the villager's name, used in the speech bubble when they're speaking."
  field :speech_bubble_color, String, null: false, description: "The color of the villager's speech bubble that appears when they're speaking."


  field :favorite_song, Objects::Music, null: false, description: "The villager's favorite K.K. Slider song."
  def favorite_song
    variant = dataloader.with(Sources::ObjectByColumn, ::ItemVariant, :id).load(object.favorite_song_id)
    dataloader.with(Sources::ObjectByColumn, ::Item, :id).load(variant.item_id)
  end

  field :default_top, Objects::ItemVariant, null: false, description: "The Top usually worn by the villager."
  def default_top
    variant = dataloader.with(Sources::ObjectByColumn, ::ItemVariant, :id).load(object.default_top_id)
  end

  field :default_umbrella, Objects::Umbrella, null: false, description: "The Umbrella usually used by the villager when it's raining."
  def default_umbrella
    variant = dataloader.with(Sources::ObjectByColumn, ::ItemVariant, :id).load(object.default_umbrella_id)
    dataloader.with(Sources::ObjectByColumn, ::Item, :id).load(variant.item_id)
  end

  field :default_wallpaper, Objects::Wallpaper, null: false, description: "The wallpaper usually used by the villager to decorate their home."
  def default_wallpaper
    variant = dataloader.with(Sources::ObjectByColumn, ::ItemVariant, :id).load(object.default_wallpaper_id)
    dataloader.with(Sources::ObjectByColumn, ::Item, :id).load(variant.item_id)
  end

  field :default_flooring, Objects::Flooring, null: false, description: "The flooring usually used by the villager to decorate their home."
  def default_flooring
    variant = dataloader.with(Sources::ObjectByColumn, ::ItemVariant, :id).load(object.default_flooring_id)
    dataloader.with(Sources::ObjectByColumn, ::Item, :id).load(variant.item_id)
  end

  field :default_workbench, Objects::ItemVariant, null: false, description: "The workbench usually used by the villager when they're DIY Crafting."
  def default_workbench
    variant = dataloader.with(Sources::ObjectByColumn, ::ItemVariant, :id).load(object.default_workbench_id)
  end

  field :default_kitchen_equipment, Objects::ItemVariant, null: false, description: "The kitchen equipment usually used by the villager when cooking."
  def default_kitchen_equipment
    variant = dataloader.with(Sources::ObjectByColumn, ::ItemVariant, :id).load(object.default_kitchen_equipment_id)
  end

  field :default_furniture, [Unions::DefaultFurniture], null: false, description: "The items usually displayed by this villager in their house as furniture."
  def default_furniture
    defaults = dataloader.with(Sources::ObjectsByColumn, DefaultItem, :villager_id).load(object.id)
    defaults = defaults.group_by(&:item_type)

    # Thankfully, we know that the only defaults here are Item, ItemVariant, and Creature
    default_item_ids = Array(defaults["Item"]).map(&:item_id)
    default_item_variant_ids = Array(defaults["ItemVariant"]).map(&:item_id)
    default_creature_ids = Array(defaults["Creature"]).map(&:item_id)

    items = dataloader.with(Sources::ObjectByColumn, ::Item, :id).load_all(default_item_ids)
    item_variants = dataloader.with(Sources::ObjectByColumn, ::ItemVariant, :id).load_all(default_item_variant_ids)
    creatures = dataloader.with(Sources::ObjectByColumn, ::Creature, :id).load_all(default_creature_ids)

    items + item_variants + creatures
  end

  # Metadata
  field :added_in_version, Scalars::Version, null: false, description: "The version of Animal Crossing New Horizons in which this recipe first appeared."
end
