class Objects::Headwear < Objects::BaseObject
  implements GraphQL::Types::Relay::Node

  implements Interfaces::Item
  implements Interfaces::Clothing
  implements Interfaces::HHAItem

  description "Headwear items can be equipped on one's head. Depending on the shape, some can be worn by both the player and villagers while others can only be worn by players."

  field :shape, Enums::HeadwearShape, null: false, description: "The shape of this headwear.", method: :hat_or_accessory_type
end
