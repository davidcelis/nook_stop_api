class Objects::VillagerPoster < Objects::BaseObject
  implements GraphQL::Types::Relay::Node

  implements Interfaces::Item
  implements Interfaces::PlaceableItem
  implements Interfaces::HHAItem

  description "Photos are wall-mounted keepsakes that can be purchased after inviting villagers to Photopia."
end
