module Interfaces::CustomizableItem
  include Interfaces::BaseInterface

  description "An item that can be customized by using customization kits or by paying Cyrus."

  field :body_type, String, description: "A descriptor for this item's body."
  field :body_customizable, Boolean, null: false, description: "Whether or not this item's body is customizable using customization kits. If false, refer to the `cyrusCustomizationPrice` field to determine if this item's body is customizable at all."
  field :pattern_type, String, description: "A descriptor for this item's pattern."
  field :pattern_customization_options, [Enums::PatternCustomizationOption], null: false, description: "A list of methods with which this item's pattern can be customized."
  field :customization_kit_type, Enums::CustomizationKitType, description: "The type of customization kit used to customize this item."
  field :customization_kit_cost, Integer, description: "The number of customization kits that must be used to customize this item."
  field :cyrus_customization_price, Integer, description: "The cost for Cyrus to customize this item, in Bells."
end
