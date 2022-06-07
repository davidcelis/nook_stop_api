module Interfaces::Item
  include Interfaces::BaseInterface

  description "Something in Animal Crossing that is considered an item."

  # Core attributes
  field :name, String, null: false, description: "The name of this item."
  field :price, Integer, description: "The price of this item in Bells. If not present, it means the item cannot be bought with Bells."
  field :resale_value, Integer, null: false, description: "The resale value of this item in Bells."

  # Attributes related to acquiring the item
  field :listed_in_catalog, Boolean, null: false, description: "Whether or not this item appears in the in-game Nook Shopping catalog."
  field :for_sale_in_catalog, Boolean, null: false, description: "Whether or not this item can be purchased in the in-game Nook Shopping catalog."
  field :sources, [String], null: false, description: "A list of sources for acquiring this item."
  field :source_notes, String, description: "Additional freeform notes on acquiring this item."
  field :seasonal_event, String, description: "The seasonal event during which this item is available."
  field :exclusive_to_seasonal_event, Boolean, description: "Whether or not this item can only be acquired during its seasonal event."
  field :alternative_currency, Enums::Currency, description: "An alternative currency with which this item can be purchased."
  field :alternative_price, Integer, description: "The amount of alternative currency with which this item can be purchased."

  field :variants, [Objects::ItemVariant], null: false, description: "A list of one or more unique variants of this item."

  # Metadata
  field :added_in_version, Scalars::Version, null: false, description: "The version of Animal Crossing New Horizons in which this item first appeared."
  field :internal_id, Integer, null: false, description: "A unique identifier for this item that is internal to the game.", method: :shared_internal_id
end
