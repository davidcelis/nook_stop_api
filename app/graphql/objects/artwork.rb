class Objects::Artwork < Objects::BaseObject
  implements GraphQL::Types::Relay::Node

  implements Interfaces::Item
  implements Interfaces::PlaceableItem
  implements Interfaces::HHAItem

  description "Artwork is purchased by Redd and assessed as genuine or fake by Blathers in the Museum."

  field :title, String, null: false, description: "The real-world name of this artwork.", method: :artwork_title
  field :label, String, null: false, description: "The artwork's label, including its creator, year, and medium.", method: :artwork_label
  field :category, Enums::ArtworkCategory, null: false, description: "The artwork's physical category.", method: :tag
  field :description, String, null: false, description: "A detailed description of the artwork."
  field :furniture_category, Enums::ArtworkFurnitureCategory, null: false, description: "The artwork's item category when placed as furniture.", method: :artwork_category
end
