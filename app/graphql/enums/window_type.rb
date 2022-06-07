class Enums::WindowType < Enums::BaseEnum
  graphql_name "WindowType"

  description "Window types that can come with certain wallpaper."

  value "ARCH", value: "Arch"
  value "CIRCULAR", value: "Circle"
  value "FOUR_PANE", value: "Four Pane"
  value "SINGLE_PANE", value: "Single Pane"
  value "SLIDING_PANE", value: "Sliding Pane"
end
