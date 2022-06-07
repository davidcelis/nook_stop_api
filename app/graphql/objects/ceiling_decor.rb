class Objects::CeilingDecor < Objects::BaseObject
  implements GraphQL::Types::Relay::Node

  implements Interfaces::Item
  implements Interfaces::CustomizableItem
  implements Interfaces::PlaceableItem
  implements Interfaces::HHAItem

  description "Ceiling Decor are pieces of furniture that can be hung from the ceiling."

  field :category, String, null: false, description: "A shared category of which this item is a member.", method: :tag
end
