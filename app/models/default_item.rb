class DefaultItem < ApplicationRecord
  belongs_to :villager
  belongs_to :item, polymorphic: true
end
