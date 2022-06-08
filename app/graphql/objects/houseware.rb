class Objects::Houseware < Objects::BaseObject
  implements GraphQL::Types::Relay::Node

  implements Interfaces::Item
  implements Interfaces::CustomizableItem
  implements Interfaces::PlaceableItem
  implements Interfaces::HHAItem

  description "Houseware is a type of general-purpose furniture item in Animal Crossing."

  field :category, String, null: false, description: "A shared category of which this item is a member.", method: :tag

  field :size, String, null: false, description: "The size of the item, formatted as lenth x width.", deprecation_reason: "This field was added before a robust `Item` interface was extracted. You should prefer the `length` and `width` fields provided by that interface instead."
  def size
    [sprintf("%g", object.length), sprintf("%g", object.width)].join("x")
  end
end
