class Objects::VillagerPhoto < Objects::BaseObject
  implements GraphQL::Types::Relay::Node

  implements Interfaces::Item
  implements Interfaces::CustomizableItem
  implements Interfaces::PlaceableItem
  implements Interfaces::HHAItem

  description "Photos are keepsakes that can be gifted by villagers after becoming good friends with them."
end
