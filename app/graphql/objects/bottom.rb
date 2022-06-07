class Objects::Bottom < Objects::BaseObject
  implements GraphQL::Types::Relay::Node

  implements Interfaces::Item
  implements Interfaces::Clothing
  implements Interfaces::HHAItem

  description "Bottoms are items that cover one's legs and can only be worn by players."
end
