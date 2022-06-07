class CreateItemsAndVariants < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      # Core attributes
      t.string :name, null: false
      t.string :category, null: false
      t.string :tag
      t.string :added_in_version, null: false

      # Attributes related to acquiring or selling the item
      t.integer :price
      t.integer :resale_value

      t.string :sources, array: true, null: false, default: []
      t.string :source_notes

      t.boolean :listed_in_catalog, null: false
      t.string :for_sale_in_catalog

      t.string :seasonal_event
      t.boolean :exclusive_to_seasonal_event, null: false

      t.string :alternative_currency
      t.integer :alternative_price

      # Attributes related to customizing the item
      t.string :body_type
      t.boolean :body_customizable
      t.string :pattern_type
      t.string :pattern_customization_options, array: true, null: false, default: []
      t.string :customization_kit_type
      t.integer :customization_kit_cost
      t.integer :cyrus_customization_price

      # Attributes related to interactivity
      t.boolean :can_be_placed_outdoors, null: false
      t.boolean :is_a_surface, null: false
      t.string :interactivity

      # Attributes related to the Happy Home Academy
      t.integer :hha_base_points
      t.string :hha_category
      t.string :hha_concepts, array: true, null: false, default: []
      t.string :hha_series
      t.string :hha_set

      # Furniture-specific attributes
      t.float :length
      t.float :width
      t.string :lighting_type
      t.string :speaker_type

      # Attributes related to wall-mounted items
      t.boolean :can_decorate_door

      # Attributes related to wallpaper, flooring, and rugs
      t.string :ceiling_type
      t.string :curtain_type
      t.string :curtain_color
      t.string :window_type
      t.string :window_pane_type
      t.string :window_color

      t.string :rug_size
      t.string :visual_effects

      # Clothing-specific attributes
      t.string :clothing_styles, array: true, null: false, default: []
      t.string :gender_presentation
      t.string :fashionable_for_season
      t.string :fashion_season_availability
      t.string :mannequin_season
      t.string :dress_up_shape
      t.boolean :can_be_equipped_by_villagers
      t.string :gender_presentation_for_villagers
      t.string :hat_or_accessory_type
      t.string :label_themes, array: true, null: false, default: []

      # Attributes related to tools/goods/food
      t.float :number_of_uses
      t.integer :food_power
      t.integer :stack_size

      # Artwork/Fossil-specific attributes
      t.string :fossil_group
      t.integer :museum_room
      t.string :artwork_title
      t.string :artwork_label
      t.string :artwork_category
      t.text :description

      # Gyroid-specific attributes
      t.string :gyroid_sound_type

      # Assign an internal ID based on our mapping, for convenience. However,
      # Artwork is "special" in that it has no shared ID across variants... Because
      # it's more likely that people will care about the genuine artifacts, choose
      # that one for its ID
      t.integer :shared_internal_id

      t.timestamps
    end

    create_table :item_variants do |t|
      t.references :item, null: false

      t.string :body_name
      t.string :pattern_name
      t.string :colors, array: true, null: false, default: []
      t.string :unique_internal_id
      t.string :image_url
      t.boolean :genuine
    end
  end
end
