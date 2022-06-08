class Objects::Recipe < Objects::BaseObject
  implements GraphQL::Types::Relay::Node

  description "DIY Recipes are used to learn how to craft things at a workbench or to cook things in a kitchen."

  field :type, Enums::CraftedItemType, null: false, description: "The type of item that is crafted using this recipe.", method: :category
  field :crafted_item_image_url, Scalars::URL, null: false, description: "A URL pointing to an image of the item crafted by this recipe.", method: :image_url

  field :item, Interfaces::Item, null: false, description: "The item crafted by this recipe."
  def item
    dataloader.with(Sources::ObjectByColumn, ::Item, :id).load(object.item_id)
  end

  field :materials, [Objects::RecipeMaterial], null: false, description: "A list of materials required to craft this recipe's item, along with their amounts."
  def materials
    dataloader.with(Sources::ObjectsByColumn, ::RecipeMaterial, :recipe_id).load(object.id)
  end

  field :price, Integer, description: "The price of this recipe in Bells. If not present, it means the recipe cannot be bought with Bells."
  field :resale_value, Integer, null: false, description: "The resale value of this recipe in Bells."

  field :sources, [String], null: false, description: "A list of sources for acquiring this recipe."
  field :source_notes, String, description: "Additional freeform notes on acquiring this recipe."

  field :seasonal_event, String, description: "The seasonal event during which this recipe is available."
  field :exclusive_to_seasonal_event, Boolean, description: "Whether or not this recipe can only be acquired during its seasonal event."

  field :alternative_currency, Enums::Currency, description: "An alternative currency with which this recipe can be purchased."
  field :alternative_price, Integer, description: "The amount of alternative currency with which this recipe can be purchased."

  field :total_recipes_to_unlock, Integer, null: false, description: "The number of other recipes that the player must learn in their lifetime before this recipe will appear on their island."

   # Metadata
  field :added_in_version, Scalars::Version, null: false, description: "The version of Animal Crossing New Horizons in which this recipe first appeared."
  field :internal_id, Integer, null: false, description: "A unique identifier for this recipe that is internal to the game.", method: :unique_internal_id
end
