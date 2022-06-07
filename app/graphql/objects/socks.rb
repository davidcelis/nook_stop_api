class Objects::Socks < Objects::BaseObject
  implements GraphQL::Types::Relay::Node

  implements Interfaces::Item
  implements Interfaces::Clothing
  implements Interfaces::HHAItem

  description "Socks can be equipped on the player's feet."
end
