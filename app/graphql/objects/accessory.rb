class Objects::Accessory < Objects::BaseObject
  implements GraphQL::Types::Relay::Node

  implements Interfaces::Item
  implements Interfaces::Clothing
  implements Interfaces::HHAItem

  description "Accessories can be equipped on one's head or face. Depending on the shape, some can be worn by both the player and villagers while others can only be worn by players."

  field :shape, Enums::AccessoryShape, null: false, description: "The shape of this accessory.", method: :hat_or_accessory_type
end
