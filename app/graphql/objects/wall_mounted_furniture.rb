class Objects::WallMountedFurniture < Objects::BaseObject
  implements GraphQL::Types::Relay::Node

  implements Interfaces::Item
  implements Interfaces::CustomizableItem
  implements Interfaces::PlaceableItem
  implements Interfaces::HHAItem

  description "Miscellaneous furniture items are distinguished from Housewares by the ability to place them on tables or other surfaces."

  field :category, String, null: false, description: "A shared category of which this item is a member.", method: :tag
  field :can_decorate_door, Boolean, null: false, description: "Whether or not this item can be mounted on the front door of the player's house."
end
