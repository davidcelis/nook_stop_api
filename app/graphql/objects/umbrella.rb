class Objects::Umbrella < Objects::BaseObject
  implements GraphQL::Types::Relay::Node

  implements Interfaces::Item
  implements Interfaces::Clothing
  implements Interfaces::HHAItem

  description "Umbrellas can be held by players or villagers. Villagers will typically only hold them when raining."
end
