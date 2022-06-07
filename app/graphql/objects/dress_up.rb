class Objects::DressUp < Objects::BaseObject
  implements GraphQL::Types::Relay::Node

  implements Interfaces::Item
  implements Interfaces::Clothing
  implements Interfaces::HHAItem

  description "Dress-Up clothes are items that cover one's legs and torso. Depending on the shape, some can be worn by both the player and villagers while others can only be worn by players."

  # Enum
  field :shape, Enums::DressUpShape, null: false, description: "The shape of this dress-up item.", method: :dress_up_shape
end
