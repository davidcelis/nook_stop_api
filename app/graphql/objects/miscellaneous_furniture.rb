class Objects::MiscellaneousFurniture < Objects::BaseObject
  implements GraphQL::Types::Relay::Node

  implements Interfaces::Item
  implements Interfaces::CustomizableItem
  implements Interfaces::PlaceableItem
  implements Interfaces::HHAItem

  description "Miscellaneous furniture items are distinguished from Housewares by the ability to place them on tables or other surfaces."

  field :category, String, null: false, description: "A shared category of which this item is a member.", method: :tag
  field :stack_size, Integer, null: false, description: "The number of times this item can be stacked onto a single slot in the player's inventory."
  field :food_power, Integer, description: "The amount of power gained by eating this item if it is edible."
end
