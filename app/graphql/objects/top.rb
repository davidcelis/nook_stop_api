class Objects::Top < Objects::BaseObject
  implements GraphQL::Types::Relay::Node

  implements Interfaces::Item
  implements Interfaces::Clothing
  implements Interfaces::HHAItem

  description "Tops are items that cover one's torso and can be worn by players and villagers."
end
