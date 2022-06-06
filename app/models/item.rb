class Item < ApplicationRecord
  has_many :variants, class_name: "ItemVariant"

  def pattern_customizable?
    pattern_customization_options.any?
  end

  def can_be_placed_on_surface?
    category.in?["Miscellaneous", "Photos"]
  end

  # For almost every kind of item, all of its variants share the same concepts
  # for Happy Home Association jobs. Artwork, however, is special. Fake art is
  # always considered to be a part of the "horror" concept and nothing else.
  def hha_concepts
    super unless category == "Artwork" && !genuine?

    ["horror"]
  end
end
