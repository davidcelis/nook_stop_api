class Objects::InteriorStructure < Objects::BaseObject
  implements GraphQL::Types::Relay::Node

  implements Interfaces::Item
  implements Interfaces::CustomizableItem
  implements Interfaces::PlaceableItem
  implements Interfaces::HHAItem

  description "Interior Structures are items that can be placed inside a home to give it structure."

  field :category, Enums::InteriorStructureType, null: false, description: "A shared category of which this item is a member.", method: :tag
end
