class Objects::Fossil < Objects::BaseObject
  implements GraphQL::Types::Relay::Node

  implements Interfaces::Item
  implements Interfaces::PlaceableItem
  implements Interfaces::HHAItem

  description "Fossil pieces are acquired by digging and assessed/identified by Blathers in the Museum. Some fossils are composed of multiple pieces and must be assembled."

  field :description, String, null: false, description: "A description of the fossil, courtesy of Blathers."
  field :group, String, null: false, description: "The group to which this fossil belongs.", method: :fossil_group
  field :museum_room, Integer, null: false, description: "The room in which this fossil is placed in the Museum."
end
