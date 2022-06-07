class Enums::WindowPaneType < Enums::BaseEnum
  graphql_name "WindowPaneType"

  description "Window pane types that can come with certain wallpaper."

  value "GLASS", value: "Glass"
  value "SCREEN", value: "Screen"
end
