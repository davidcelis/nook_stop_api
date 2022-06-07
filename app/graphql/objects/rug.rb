class Objects::Rug < Objects::BaseObject
  implements GraphQL::Types::Relay::Node

  implements Interfaces::Item
  implements Interfaces::PlaceableItem
  implements Interfaces::HHAItem

  description "Rugs come in a variety of sizes and can decorate a room's floor with or without furniture placed on top."

  field :category, String, null: false, description: "A shared category of which this item is a member.", method: :tag
  field :size, Enums::RugSize, null: false, description: "The size of this rug as determined by Saharah.", method: :rug_size
end
