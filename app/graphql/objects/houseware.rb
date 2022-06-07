class Objects::Houseware < Objects::BaseObject
  implements GraphQL::Types::Relay::Node

  implements Interfaces::Item
  implements Interfaces::CustomizableItem
  implements Interfaces::PlaceableItem
  implements Interfaces::HHAItem

  description "Houseware is a type of general-purpose furniture item in Animal Crossing."

  field :category, String, null: false, description: "A shared category of which this item is a member.", method: :tag
end
