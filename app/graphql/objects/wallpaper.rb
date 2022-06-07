class Objects::Wallpaper < Objects::BaseObject
  implements GraphQL::Types::Relay::Node

  implements Interfaces::Item
  implements Interfaces::HHAItem

  description "Wallpaper can be used to customize the appearance of a room's walls."

  field :category, String, null: false, description: "A shared category of which this item is a member.", method: :tag

  field :visual_effects, Enums::VisualEffects, description: "The kind of animated visual effects this wallpaper has."
  field :ceiling_type, Enums::CeilingType, description: "The room's ceiling type when this wallpaper is applied."
  field :curtain_type, Enums::CurtainType, description: "The type of curtains used by the room's windows when this wallpaper is applied."
  field :curtain_color, String, description: "The color of the curtains used by the room's windows when this wallpaper is applied."
  field :window_type, Enums::WindowType, description: "The type of windows installed in the room when this wallpaper is applied."
  field :window_pane_type, Enums::WindowPaneType, description: "The type of pane used by the room's windows when this wallpaper is applied."
  field :window_color, String, description: "The color of the frames used by the room's windows when this wallpaper is applied."
end
