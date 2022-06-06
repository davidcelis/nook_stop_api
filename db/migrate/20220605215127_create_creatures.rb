class CreateCreatures < ActiveRecord::Migration[7.0]
  def change
    create_table :creatures do |t|
      t.string :type, null: false

      t.string :name, null: false
      t.text :description, null: false
      t.text :catch_phrase, null: false
      t.string :added_in_version, null: false

      t.string :where_to_catch, null: false
      t.string :weather_conditions
      t.string :difficulty_to_catch
      t.string :field_of_vision
      t.string :movement_speed
      t.string :shadow_size
      t.int4range :spawn_rate

      t.integer :total_catches_to_unlock
      t.jsonb :active_times, null: false, default: {}

      t.integer :resale_value, null: false

      t.boolean :is_a_surface, null: false
      t.string :colors, array: true, default: []
      t.integer :hha_base_points
      t.string :hha_category
      t.string :lighting_type
      t.float :length, null: false
      t.float :width, null: false

      t.string :image_url, null: false
      t.integer :unique_internal_id, null: false

      t.timestamps
    end
  end
end
