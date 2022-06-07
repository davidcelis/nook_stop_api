class Objects::HandheldItem < Objects::BaseObject
  implements GraphQL::Types::Relay::Node

  implements Interfaces::Item
  implements Interfaces::PlaceableItem
  implements Interfaces::CustomizableItem
  implements Interfaces::HHAItem

  description "Handheld Items are items that can be held by the player or villagers, such as tools, wands, or beverages."

  field :number_of_uses, Float, description: "The number of times this item can be used before breaking or being consumed. If `null`, the item can be used indefinitely without breaking or being consumed."
  def number_of_uses
    object.number_of_uses unless object.number_of_uses.infinite?
  end

  field :stack_size, Integer, null: false, description: "The number of times this item can be stacked onto a single slot in the player's inventory."
end
