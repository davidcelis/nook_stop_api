class CreateVillagers < ActiveRecord::Migration[7.0]
  def change
    create_table :villagers do |t|
      t.string :name, null: false
      t.string :species, null: false
      t.string :gender, null: false
      t.string :catchphrase, null: false
      t.integer :birth_month, null: false
      t.integer :birth_date, null: false
      t.string :added_in_version, null: false

      t.string :personality, null: false
      t.string :personality_type, null: false
      t.string :hobby, null: false
      t.string :styles, array: true, default: []
      t.string :colors, array: true, default: []
      t.references :favorite_song, null: false
      t.text :favorite_saying

      t.references :default_top, null: false
      t.references :default_umbrella, null: false
      t.references :default_wallpaper, null: false
      t.references :default_flooring, null: false
      t.references :default_workbench, null: false
      t.references :default_kitchen_equipment, null: false

      t.string :name_color, null: false
      t.string :speech_bubble_color, null: false
      t.string :icon_url, null: false
      t.string :image_url, null: false
      t.string :house_image_url

      t.timestamps
    end

    create_table :default_items do |t|
      t.references :villager, index: true
      t.string :item_type, index: true
      t.bigint :item_id, index: true

      t.index [:villager_id, :item_type, :item_id], name: "idx_furniture_defaults_on_villager_id_and_item_type_and_item_id"
    end
  end
end
