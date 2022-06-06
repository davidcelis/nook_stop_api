class CreateRecipes < ActiveRecord::Migration[7.0]
  def change
    create_table :recipes do |t|
      t.references :item, null: false, index: true

      t.string :category, null: false
      t.string :added_in_version, null: false

      t.integer :price
      t.integer :resale_value
      t.string :alternative_currency
      t.integer :alternative_price

      t.string :sources, array: true, default: []
      t.string :source_notes
      t.string :seasonal_event
      t.boolean :exclusive_to_seasonal_event, null: false
      t.integer :total_recipes_to_unlock

      t.string :image_url, null: false
      t.integer :unique_internal_id, null: false

      t.timestamps
    end

    create_table :recipe_materials do |t|
      t.references :recipe, null: false, index: true
      t.string :item_type, index: true
      t.bigint :item_id, index: true

      t.integer :count, null: false

      t.timestamps

      t.index [:item_type, :item_id]
    end
  end
end
