# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
ITEM_SHEETS = [
  "Housewares",
  "Miscellaneous",
  "Wall-mounted",
  "Ceiling Decor",
  "Interior Structures",
  "Wallpaper",
  "Floors",
  "Rugs",
  "Photos",
  "Posters",
  "Tools/Goods",
  "Fencing",
  "Tops",
  "Bottoms",
  "Dress-Up",
  "Headwear",
  "Accessories",
  "Socks",
  "Shoes",
  "Bags",
  "Umbrellas",
  "Clothing Other",
  "Music",
  "Fossils",
  "Artwork",
  "Gyroids",
  "Other"
].freeze

CREATURE_SHEETS = [
  "Insects",
  "Fish",
  "Sea Creatures"
].freeze


SHEET_TO_SHARED_AND_UNIQUE_IDS = {
  "Housewares"          => {shared: "internalId",   unique: "variantId"},
  "Miscellaneous"       => {shared: "internalId",   unique: "variantId"},
  "Wall-mounted"        => {shared: "internalId",   unique: "variantId"},
  "Ceiling Decor"       => {shared: "internalId",   unique: "variantId"},
  "Interior Structures" => {shared: "internalId",   unique: "variantId"},
  "Wallpaper"           => {shared: nil,            unique: "internalId"}, # No variants
  "Floors"              => {shared: nil,            unique: "internalId"}, # No variants
  "Rugs"                => {shared: nil,            unique: "internalId"}, # No variants
  "Photos"              => {shared: "internalId",   unique: "variantId"},
  "Posters"             => {shared: nil,            unique: "internalId"}, # No variants
  "Tools/Goods"         => {shared: "internalId",   unique: "variantId"},
  "Fencing"             => {shared: "internalId",   unique: "variantId"},
  "Tops"                => {shared: "clothGroupId", unique: "internalId"},
  "Bottoms"             => {shared: "clothGroupId", unique: "internalId"},
  "Dress-Up"            => {shared: "clothGroupId", unique: "internalId"},
  "Headwear"            => {shared: "clothGroupId", unique: "internalId"},
  "Accessories"         => {shared: "clothGroupId", unique: "internalId"},
  "Socks"               => {shared: "clothGroupId", unique: "internalId"},
  "Shoes"               => {shared: "clothGroupId", unique: "internalId"},
  "Bags"                => {shared: "clothGroupId", unique: "internalId"},
  "Umbrellas"           => {shared: nil,            unique: "internalId"}, # No variants
  "Clothing Other"      => {shared: "clothGroupId", unique: "internalId"},
  "Music"               => {shared: nil,            unique: "internalId"}, # No variants
  "Fossils"             => {shared: nil,            unique: "internalId"}, # No variants
  "Artwork"             => {shared: nil,            unique: "internalId"}, # Has variants, but no shared ID
  "Gyroids"             => {shared: "internalId",   unique: "variantId"},
  "Other"               => {shared: nil,            unique: "internalId"}, # No variants
}.freeze

class ItemCreator
  def self.create_with_variations(attributes)
    item = Item.new

    # Core attributes
    item.name = attributes["name"]
    item.category = attributes["sourceSheet"]
    item.tag = attributes["tag"]
    item.added_in_version = attributes["versionAdded"] || "1.0.0"

    # Attributes related to acquiring or selling the item
    item.price = attributes.dig("variants", 0, "buy") if attributes.dig("variants", 0, "buy") > 0
    item.resale_value = attributes.dig("variants", 0, "sell")

    item.sources = Array(attributes.dig("variants", 0, "source"))
    item.source_notes = attributes["sourceNotes"]

    item.listed_in_catalog = attributes["catalog"].in?(["Seasonal", "Not for sale", "For sale"])
    item.for_sale_in_catalog = case attributes["catalog"]
      when "Seasonal" then "Seasonally"
      when "For sale" then "Always"
    end

    item.seasonal_event = attributes["seasonEvent"]
    item.exclusive_to_seasonal_event = !!attributes["seasonEventExclusive"]

    item.alternative_currency = attributes["exchangeCurrency"]
    item.alternative_price = attributes["exchangePrice"]

    # Attributes related to customizing the item
    item.body_type = attributes.dig("variants", 0, "bodyTitle")
    item.body_customizable = attributes["variants"].any? { |v| v["bodyCustomize"] } || !!attributes["customize"]
    item.pattern_type = attributes["patternTitle"]
    item.pattern_customization_options = attributes["patternCustomizeOptions"].to_s.split("; ")
    item.customization_kit_type = attributes["kitType"]
    item.customization_kit_cost = attributes["customizationKitCost"]
    item.cyrus_customization_price = attributes["cyrusCustomizePrice"]

    # Attributes related to interactivity
    item.can_be_placed_outdoors = !!attributes["outdoor"]
    item.is_a_surface = !!attributes["surface"]
    item.interactivity = if attributes["interact"].is_a?(String)
      attributes["interact"]
    elsif attributes["interact"] == true
      "Other"
    end

    # Attributes related to the Happy Home Association
    item.hha_base_points = attributes["hhaBasePoints"]
    item.hha_category = attributes["hhaCategory"]
    item.hha_concepts = attributes.dig("variants", 0, "themes")
    item.hha_series = attributes["series"]
    item.hha_set = attributes["set"]

    # Furniture-specific attributes
    item.length, item.width = attributes["size"].to_s.split("x").map(&:to_f)
    item.lighting_type = attributes["lightingType"]
    item.speaker_type = attributes["speakerType"]

    # Attributes related to wall-mounted items
    item.can_decorate_door = !!attributes["doorDeco"]

    # Attributes related to wallpaper, flooring, and rugs
    item.ceiling_type = attributes["ceilingType"]

    item.curtain_type = attributes["curtainType"]
    item.curtain_color = attributes["curtainColor"]

    item.window_type = attributes["windowType"]
    item.window_pane_type = attributes["paneType"]
    item.window_color = attributes["windowColor"]

    item.rug_size = attributes["sizeCategory"]
    item.visual_effects = (attributes["vfxType"] || "Other") if attributes["vfx"]

    # Clothing-specific attributes
    item.clothing_styles = [attributes["style1"], attributes["style2"]]
    item.gender_presentation = attributes["gender"]
    item.fashionable_for_season = attributes["seasonality"]
    item.fashion_season_availability = attributes["seasonalAvailability"]
    item.mannequin_season = attributes["mannequinSeason"]
    item.dress_up_shape = attributes["primaryShape"]
    item.gender_presentation_for_villagers = attributes["villagerGender"] if attributes["villagerEquippable"]
    item.hat_or_accessory_type = attributes["type"]
    item.label_themes = Array(attributes.dig("variants", 0, "labelThemes"))

    # Attributes related to tools/goods/food
    item.number_of_uses = (attributes["uses"] == -1 ? Float::INFINITY : attributes["uses"])
    item.food_power = attributes["foodPower"]
    item.stack_size = attributes["stackSize"]

    # Attributes related to fossils and artwork
    item.fossil_group = attributes["fossilGroup"]
    item.museum_room = attributes["museum"].last.to_i if attributes["museum"]
    item.artwork_title = attributes["realArtworkTitle"]
    item.artwork_label = attributes["artist"]
    item.artwork_category = attributes["category"]
    item.description = attributes["description"]

    # Gyroid-specific attributes
    item.gyroid_sound_type = attributes["soundType"]

    # Assign an internal ID based on our mapping, for convenience. However,
    # Artwork is "special" in that it has no shared ID across variants... Because
    # it's more likely that people will care about the genuine artifacts, choose
    # that one for its ID
    if item.category == "Artwork"
      item.shared_internal_id = attributes.dig("variants", 0, "internalId")
    else
      attribute = SHEET_TO_SHARED_AND_UNIQUE_IDS[item.category][:shared] || SHEET_TO_SHARED_AND_UNIQUE_IDS[item.category][:unique]
      item.shared_internal_id = attributes.dig("variants", 0, attribute)
    end

    item.save!

    # Create variants
    attributes["variants"].each do |variant_attributes|
      variant = item.variants.new

      variant.body_name = variant_attributes["variation"]
      variant.pattern_name = variant_attributes["pattern"]
      variant.colors = variant_attributes["colors"]

      variant.unique_internal_id = variant_attributes[SHEET_TO_SHARED_AND_UNIQUE_IDS[item.category][:unique]]
      variant.image_url = variant_attributes["image"] || variant_attributes["closetImage"] || variant_attributes["storageImage"] || variant_attributes["albumImage"] || variant_attributes["framedImage"] || variant_attributes["inventoryImage"]

      variant.genuine = variant_attributes["genuine"]

      variant.save!
    end
  end
end

class CreatureCreator
  def self.create(attributes)
    creature = attributes["sourceSheet"].tr(" ", "").classify.constantize.new

    # Core attributes
    creature.name = attributes["name"]
    creature.description = attributes["description"]
    creature.catch_phrase = attributes["catchPhrase"]
    creature.added_in_version = attributes["versionAdded"] || "1.0.0"

    # How to catch the creature
    creature.where_to_catch = attributes["whereHow"]
    creature.where_to_catch = "Sea" if creature.is_a?(SeaCreature)
    creature.weather_conditions = case attributes["weather"]
      when "Any except rain" then "Clear"
      when "Rain only" then "Rain"
    end
    creature.difficulty_to_catch = attributes["catchDifficulty"]
    creature.field_of_vision = attributes["vision"]
    creature.movement_speed = attributes["movementSpeed"]
    creature.shadow_size = attributes["shadow"]

    min_spawn, max_spawn = attributes["spawnRates"].split("-")
    max_spawn ||= min_spawn
    creature.spawn_rate = min_spawn..max_spawn

    creature.total_catches_to_unlock = attributes["totalCatchesToUnlock"]

    # Add a special case for Coelacanth, the only fish to require rain
    if creature.name == "coelacanth"
      creature.weather_conditions = "Rain"
      creature.where_to_catch = "Sea"
    end

    # When to catch the creature
    creature.active_times = {
      "northern" => [],
      "southern" => []
    }

    ["northern", "southern"].each do |hemisphere|
      attributes.dig("activeMonths", hemisphere).each do |month_config|
        hours = month_config["activeHours"].flatten.map(&:to_i)

        creature.active_times[hemisphere] << month_config.slice("month").tap do |month|
          month["hours"] = hours unless hours == [0, 0]
        end
      end
    end

    # CJ/Flick will buy for 1.5 * the price, rounded up or down
    creature.resale_value = attributes["sell"]

    # Attributes related to placing the creature as a furniture item
    creature.is_a_surface = !!attributes["surface"]
    creature.colors = Array(attributes["colors"])
    creature.hha_base_points = attributes["hhaBasePoints"]
    creature.hha_category = attributes["hhaCategory"]
    creature.lighting_type = attributes["lightingType"]
    creature.length, creature.width = attributes["size"].to_s.split("x").map(&:to_f)

    creature.image_url = attributes["critterpediaImage"]
    creature.unique_internal_id = attributes["internalId"]

    creature.save!
  end
end

class VillagerCreator
  def self.create(attributes)
    villager = Villager.new

    # Core attributes
    villager.name = attributes["name"]
    villager.species = attributes["species"]
    villager.gender = attributes["gender"]
    villager.catchphrase = attributes["catchphrase"]
    villager.birth_month, villager.birth_date = attributes["birthday"].split("/").map(&:to_i)
    villager.added_in_version = attributes["versionAdded"] || "1.0.0"

    # Personality-based attributes
    villager.personality = attributes["personality"]
    villager.personality_type = attributes["subtype"]
    villager.hobby = attributes["hobby"]
    villager.styles = attributes["styles"]
    villager.colors = attributes["colors"]
    villager.favorite_song = Item.find_by(name: attributes["favoriteSong"], category: "Music").variants.first
    villager.favorite_saying = attributes["favoriteSaying"]

    # Associate Villager to its possessions
    villager.default_top = ItemVariant.find_by(unique_internal_id: attributes["defaultClothing"])
    villager.default_umbrella = Item.find_by(name: attributes["defaultUmbrella"], category: "Umbrellas").variants.first
    villager.default_wallpaper = Item.find_by(name: attributes["wallpaper"], category: "Wallpaper").variants.first
    villager.default_flooring = Item.find_by(name: attributes["flooring"], category: "Floors").variants.first

    workbench_item_id, workbench_variant_id = attributes["diyWorkbench"].to_s.split(",")
    workbench = Item.find_by(shared_internal_id: workbench_item_id)
    workbench_variant = workbench_variant_id ? workbench.variants.find_by(unique_internal_id: workbench_variant_id) : workbench.variants.first
    villager.default_workbench = workbench_variant

    kitchen_equipment_item_id, kitchen_equipment_variant_id = attributes["kitchenEquipment"].to_s.split(",")
    kitchen_equipment = Item.find_by(shared_internal_id: kitchen_equipment_item_id)
    kitchen_equipment_variant = kitchen_equipment_variant_id ? kitchen_equipment.variants.find_by(unique_internal_id: kitchen_equipment_variant_id) : kitchen_equipment.variants.first
    villager.default_kitchen_equipment = kitchen_equipment_variant

    # Visual/stylistic elements
    villager.name_color = attributes["nameColor"]
    villager.speech_bubble_color = attributes["bubbleColor"]
    villager.icon_url = attributes["iconImage"]
    villager.image_url = attributes["photoImage"]
    villager.house_image_url = attributes["houseImage"]

    villager.save!

    # Finally, associate the villager with all of its default furniture. Unlike
    # the above associations, however, we unfortunately don't have information
    # about the specific variant that villagers possess, so we use a list of
    # items instead of item variants.
    attributes["furnitureList"].split(";").map(&:to_i).each do |item_id|
      item = Item.find_by(shared_internal_id: item_id)
      item ||= ItemVariant.find_by(unique_internal_id: item_id)
      item ||= Creature.find_by(unique_internal_id: item_id)

      if item.present?
        DefaultItem.create!(villager: villager, item: item)
      else
        raise ActiveRecord::RecordNotFound, "Couldn't find an Item based on furniture ID: #{item_id}"
      end
    end
  end
end

class RecipeCreator
  def self.create(attributes)
    recipe = Recipe.new

    # Core attributes
    recipe.item = Item.find_by(shared_internal_id: attributes["craftedItemInternalId"])
    recipe.item ||= ItemVariant.find_by(unique_internal_id: attributes["craftedItemInternalId"]).item
    recipe.category = attributes["category"]
    recipe.added_in_version = attributes["versionAdded"] || "1.0.0"

    # Pricing information
    recipe.price = attributes["buy"] if attributes["buy"] > 0
    recipe.resale_value = attributes["sell"]
    recipe.alternative_currency = attributes["exchangeCurrency"]
    recipe.alternative_price = attributes["exchangePrice"]

    # How to get the recipe
    recipe.sources = Array(attributes["source"])
    recipe.source_notes = attributes["sourceNotes"]
    recipe.seasonal_event = attributes["seasonEvent"]
    recipe.exclusive_to_seasonal_event = !!attributes["seasonEventExclusive"]
    recipe.total_recipes_to_unlock = attributes["recipesToUnlock"]

    recipe.image_url = attributes["image"]
    recipe.unique_internal_id = attributes["internalId"]

    recipe.save!

    attributes["materials"].each do |name, count|
      if (match = name.match(/\A(?<count>\d+)\s+turnips\z/))
        name = "turnips"
        count = match[:count].to_i
      elsif (match = name.match(/\A(?<count>[\d,]+)\s+Bells\z/))
        name = "Bell bag"
        count *= match[:count].to_i
      end

      item = Item.find_by(name: name)
      item ||= Creature.find_by(name: name)

      RecipeMaterial.create!(recipe: recipe, item: item, count: count)
    end
  rescue
    binding.pry

    raise
  end
end

data = JSON.parse(File.read("db/all.json"))
data.each do |attributes|
  next unless attributes["sourceSheet"].in?(ITEM_SHEETS)
  ItemCreator.create_with_variations(attributes)
end

data.each do |attributes|
  next unless attributes["sourceSheet"].in?(CREATURE_SHEETS)
  CreatureCreator.create(attributes)
end

data.each do |attributes|
  next unless attributes["sourceSheet"] == "Villagers"
  VillagerCreator.create(attributes)
end

data.each do |attributes|
  next unless attributes["sourceSheet"] == "Recipes"
  RecipeCreator.create(attributes)
end

### IGNORE
#
# "Construction"
# "Achievements"
# "Special NPCs"
# "Reactions"
# "Message Cards"
# "Seasons and Events"
# "Paradise Planning"
