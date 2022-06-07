class Item < ApplicationRecord
  has_many :variants, class_name: "ItemVariant"

  def pattern_customizable?
    pattern_customization_options.any?
  end

  def can_be_placed_on_surface?
    category.in?["Miscellaneous", "Photos"]
  end

  def sources
    return ["Assessing fossils"] if category == "Fossils"

    super
  end
end
