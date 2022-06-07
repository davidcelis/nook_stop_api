class Objects::Flooring < Objects::BaseObject
  implements GraphQL::Types::Relay::Node

  implements Interfaces::Item
  implements Interfaces::HHAItem

  description "Flooring can be used to customize the appearance of a room's floors."

  field :category, String, null: false, description: "A shared category of which this item is a member.", method: :tag
  field :visual_effects, Enums::VisualEffects, description: "The kind of animated visual effects this flooring has."
end
