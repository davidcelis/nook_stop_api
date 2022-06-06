class Villager < ApplicationRecord
  belongs_to :favorite_song, class_name: "ItemVariant"

  belongs_to :default_top, class_name: "ItemVariant"
  belongs_to :default_umbrella, class_name: "ItemVariant"

  belongs_to :default_wallpaper, class_name: "ItemVariant"
  belongs_to :default_flooring, class_name: "ItemVariant"
  belongs_to :default_workbench, class_name: "ItemVariant"
  belongs_to :default_kitchen_equipment, class_name: "ItemVariant"

  has_many :item_defaults
  has_many :default_items, through: :item_defaults, source: :item
end
