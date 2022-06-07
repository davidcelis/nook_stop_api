class Objects::Music < Objects::BaseObject
  implements GraphQL::Types::Relay::Node

  implements Interfaces::Item
  implements Interfaces::PlaceableItem
  implements Interfaces::HHAItem

  description "Music albums can be registered and played by interacting with a speaker. They can also be placed on a surface or the ground to be displayed in a frame."
end
