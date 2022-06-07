class Objects::Wetsuit < Objects::BaseObject
  implements GraphQL::Types::Relay::Node

  implements Interfaces::Item
  implements Interfaces::Clothing
  implements Interfaces::HHAItem

  description "Wetsuits are items that cover one's legs and torso like Dress-Up items. Unlike Dress-Up items, however, they can only be worn by players and allow the player to dive into the sea and catch Sea Creatures."
end
