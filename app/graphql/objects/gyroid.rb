class Objects::Gyroid < Objects::BaseObject
  implements GraphQL::Types::Relay::Node

  implements Interfaces::Item
  implements Interfaces::CustomizableItem
  implements Interfaces::PlaceableItem
  implements Interfaces::HHAItem

  description "Gyroids are acquired by digging and play sounds when interacted with."

  field :sound_type, Enums::GyroidSoundType, null: false, description: "The type of sound played by this Gyroid when interacted with.", method: :gyroid_sound_type
end
