class RecipeMaterial < ApplicationRecord
  belongs_to :recipe
  belongs_to :item, polymorphic: true
end
