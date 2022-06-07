class Objects::Bag < Objects::BaseObject
  implements GraphQL::Types::Relay::Node

  implements Interfaces::Item
  implements Interfaces::Clothing
  implements Interfaces::HHAItem

  description "Bags can be worn or held by players."
end
