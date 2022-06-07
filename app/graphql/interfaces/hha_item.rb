module Interfaces::HHAItem
  include Interfaces::BaseInterface

  description "An item that can be scored by the Happy Home Academy."

  field :hha_base_points, Integer, null: false, description: "The minimum number of points awarded by the Happy Home Academy for displaying this item."
  field :hha_category, Enums::HHACategory, description: "A shared category of which this item is a member, as determined by the Happy Home Academy."
  field :hha_concepts, [Enums::HHAConcept], null: false, description: "A list of Happy Home Academy \"concepts\" to which this item belongs."
  field :hha_series, Enums::HHASeries, description: "The Happy Home Academy \"series\" in which this item belongs."
  field :hha_set, Enums::HHASet, description: "The Happy Home Academy \"furniture set\" in which this item belongs."
end
