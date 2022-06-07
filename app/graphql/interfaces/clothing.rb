module Interfaces::Clothing
  include Interfaces::BaseInterface
  include Interfaces::PlaceableItem

  description "An item that can be worn by players and, sometimes, villagers. Clothing items may also be placed and displayed as furniture or on mannequins."

  field :styles, [String], null: false, description: "The fashion styles associated with this item.", method: :clothing_styles
  field :label_themes, [String], null: false, description: "Label's fashion themes for which this item fits."
  field :fashionable_for_season, Enums::Season, description: "The season during which this item is considered fashionable. If `null`, the item is considered to be fashionable year-round."
  field :fashion_season_availability, Enums::Season, description: "The season during which this item is available to be purchased from the Able Sisters. If `null`, the item can be purchased from them year-round."
  field :mannequin_season, [Enums::Season], null: false, description: "The season or seasons during which this item will appear on mannequins in the Apparel Shop."
  def mannequin_season
    object.mannequin_season.split("; ")
  end

  field :can_be_worn_by_villagers, Boolean, null: false, description: "Whether or not this item can be worn by villagers", method: :can_be_equipped_by_villagers
  field :gender_presentation, Enums::GenderPresentation, description: "The gender presentation typically associated with this item when worn by the player."
  field :gender_presentation_for_villagers, Enums::GenderPresentation, description: "The gender presentation typically associated with this item when worn by villagers."
end
