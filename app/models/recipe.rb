class Recipe < ApplicationRecord
  belongs_to :item
  has_many :materials, class_name: "RecipeMaterial"
end
