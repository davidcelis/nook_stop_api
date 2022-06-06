# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_06_06_183841) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "creatures", force: :cascade do |t|
    t.string "type", null: false
    t.string "name", null: false
    t.text "description", null: false
    t.text "catch_phrase", null: false
    t.string "added_in_version", null: false
    t.string "where_to_catch", null: false
    t.string "weather_conditions"
    t.string "difficulty_to_catch"
    t.string "field_of_vision"
    t.string "movement_speed"
    t.string "shadow_size"
    t.int4range "spawn_rate"
    t.integer "total_catches_to_unlock"
    t.jsonb "active_times", default: {}, null: false
    t.integer "resale_value", null: false
    t.boolean "is_a_surface", null: false
    t.string "colors", default: [], array: true
    t.integer "hha_base_points"
    t.string "hha_category"
    t.string "lighting_type"
    t.float "length", null: false
    t.float "width", null: false
    t.string "image_url", null: false
    t.integer "unique_internal_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "default_items", force: :cascade do |t|
    t.bigint "villager_id"
    t.string "item_type"
    t.bigint "item_id"
    t.index ["item_id"], name: "index_default_items_on_item_id"
    t.index ["item_type"], name: "index_default_items_on_item_type"
    t.index ["villager_id", "item_type", "item_id"], name: "idx_furniture_defaults_on_villager_id_and_item_type_and_item_id"
    t.index ["villager_id"], name: "index_default_items_on_villager_id"
  end

  create_table "item_variants", force: :cascade do |t|
    t.bigint "item_id", null: false
    t.string "body_name"
    t.string "pattern_name"
    t.string "colors", default: [], null: false, array: true
    t.string "unique_internal_id"
    t.string "image_url"
    t.boolean "genuine"
    t.index ["item_id"], name: "index_item_variants_on_item_id"
  end

  create_table "items", force: :cascade do |t|
    t.string "name", null: false
    t.string "category", null: false
    t.string "tag"
    t.string "added_in_version", null: false
    t.integer "price"
    t.integer "resale_value"
    t.string "sources", default: [], null: false, array: true
    t.string "source_notes"
    t.boolean "listed_in_catalog", null: false
    t.string "for_sale_in_catalog"
    t.string "seasonal_event"
    t.boolean "exclusive_to_seasonal_event", null: false
    t.string "alternative_currency"
    t.integer "alternative_price"
    t.string "body_type"
    t.boolean "body_customizable"
    t.string "pattern_type"
    t.string "pattern_customization_options", default: [], null: false, array: true
    t.string "customization_kit_type"
    t.integer "customization_kit_cost"
    t.integer "cyrus_customization_price"
    t.boolean "can_be_placed_outdoors", null: false
    t.boolean "is_a_surface", null: false
    t.string "interactivity"
    t.integer "hha_base_points"
    t.string "hha_category"
    t.string "hha_concepts", default: [], null: false, array: true
    t.string "hha_series"
    t.string "hha_set"
    t.float "length"
    t.float "width"
    t.string "lighting_type"
    t.string "speaker_type"
    t.boolean "can_decorate_door"
    t.string "ceiling_type"
    t.string "curtain_type"
    t.string "curtain_color"
    t.string "window_type"
    t.string "window_pane_type"
    t.string "window_color"
    t.string "rug_size"
    t.string "visual_effects"
    t.string "clothing_styles", default: [], null: false, array: true
    t.string "gender_presentation"
    t.string "fashionable_for_season"
    t.string "fashion_season_availability"
    t.string "mannequin_season"
    t.string "dress_up_shape"
    t.string "gender_presentation_for_villagers"
    t.string "hat_or_accessory_type"
    t.string "label_themes", default: [], null: false, array: true
    t.float "number_of_uses"
    t.integer "food_power"
    t.integer "stack_size"
    t.string "fossil_group"
    t.integer "museum_room"
    t.string "artwork_title"
    t.string "artwork_label"
    t.string "artwork_category"
    t.text "description"
    t.string "gyroid_sound_type"
    t.integer "shared_internal_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "recipe_materials", force: :cascade do |t|
    t.bigint "recipe_id", null: false
    t.string "item_type"
    t.bigint "item_id"
    t.integer "count", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_recipe_materials_on_item_id"
    t.index ["item_type", "item_id"], name: "index_recipe_materials_on_item_type_and_item_id"
    t.index ["item_type"], name: "index_recipe_materials_on_item_type"
    t.index ["recipe_id"], name: "index_recipe_materials_on_recipe_id"
  end

  create_table "recipes", force: :cascade do |t|
    t.bigint "item_id", null: false
    t.string "category", null: false
    t.string "added_in_version", null: false
    t.integer "price"
    t.integer "resale_value"
    t.string "alternative_currency"
    t.integer "alternative_price"
    t.string "sources", default: [], array: true
    t.string "source_notes"
    t.string "seasonal_event"
    t.boolean "exclusive_to_seasonal_event", null: false
    t.integer "total_recipes_to_unlock"
    t.string "image_url", null: false
    t.integer "unique_internal_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_recipes_on_item_id"
  end

  create_table "villagers", force: :cascade do |t|
    t.string "name", null: false
    t.string "species", null: false
    t.string "gender", null: false
    t.string "catchphrase", null: false
    t.integer "birth_month", null: false
    t.integer "birth_date", null: false
    t.string "added_in_version", null: false
    t.string "personality", null: false
    t.string "personality_type", null: false
    t.string "hobby", null: false
    t.string "styles", default: [], array: true
    t.string "colors", default: [], array: true
    t.bigint "favorite_song_id", null: false
    t.text "favorite_saying"
    t.bigint "default_top_id", null: false
    t.bigint "default_umbrella_id", null: false
    t.bigint "default_wallpaper_id", null: false
    t.bigint "default_flooring_id", null: false
    t.bigint "default_workbench_id", null: false
    t.bigint "default_kitchen_equipment_id", null: false
    t.string "name_color", null: false
    t.string "speech_bubble_color", null: false
    t.string "icon_url", null: false
    t.string "image_url", null: false
    t.string "house_image_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["default_flooring_id"], name: "index_villagers_on_default_flooring_id"
    t.index ["default_kitchen_equipment_id"], name: "index_villagers_on_default_kitchen_equipment_id"
    t.index ["default_top_id"], name: "index_villagers_on_default_top_id"
    t.index ["default_umbrella_id"], name: "index_villagers_on_default_umbrella_id"
    t.index ["default_wallpaper_id"], name: "index_villagers_on_default_wallpaper_id"
    t.index ["default_workbench_id"], name: "index_villagers_on_default_workbench_id"
    t.index ["favorite_song_id"], name: "index_villagers_on_favorite_song_id"
  end

end
