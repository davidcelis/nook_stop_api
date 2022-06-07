class Objects::OtherItem < Objects::BaseObject
  implements GraphQL::Types::Relay::Node

  implements Interfaces::Item
  implements Interfaces::PlaceableItem
  implements Interfaces::HHAItem

  description "Other Items are items which do not neatly fit into any other Item type."

  field :category, String, null: false, description: "A shared category of which this item is a member.", method: :tag
  field :can_be_placed_outdoors, Boolean, null: false, description: "Whether or not this item can be placed outdoors."
  def can_be_placed_outdoors
    true
  end

  field :length, Float, null: false, description: "The length of this item when placed, in grid blocks."
  field :width, Float, null: false, description: "The width of this item when placed, in grid blocks."
  def length() 1.0 end
  def width() 1.0 end

  field :food_power, Integer, description: "The amount of power gained by eating this item if it is edible."
end
