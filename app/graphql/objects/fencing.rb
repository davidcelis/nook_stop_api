class Objects::Fencing < Objects::BaseObject
  implements GraphQL::Types::Relay::Node

  implements Interfaces::Item
  implements Interfaces::CustomizableItem

  description "Fencing is a special item that can be placed outdoors and provide structure to an island."

  field :stack_size, Integer, null: false, description: "The number of times this item can be stacked onto a single slot in the player's inventory."
end
