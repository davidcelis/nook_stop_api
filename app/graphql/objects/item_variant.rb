class Objects::ItemVariant < Objects::BaseObject
  implements GraphQL::Types::Relay::Node

  description "Variants are specific versions of Items. Every Item has at least one \"variant\", but many have multiple variants."

  field :item, Interfaces::Item, null: false, description: "The Item of which this object is a variant."

  field :body_name, String, description: "The name of this variant's body. Can be used with the `bodyType` of its `item` to construct a more complete name for this variant."
  field :pattern_name, String, description: "The name of this variant's pattern. Can be used with the `patternType` of its `item` to construct a more complete name for this variant."

  field :colors, [String], null: false, description: "The main colors of this variant."
  field :internal_id, String, null: false, description: "A unique identifier for this variant that is internal to the game.", method: :unique_internal_id
  field :image_url, Scalars::URL, description: "A URL that points to an image of this variant."

  field :genuine, Boolean, description: "Only set for variants of Artwork and is used to distinguish between Artwork's genuine and fake variants."
end
