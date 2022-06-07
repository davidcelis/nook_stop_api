class Enums::CurtainType < Enums::BaseEnum
  graphql_name "CurtainType"

  description "Curtain types that can come with certain wallpaper."

  value "CURTAINS", value: "Curtains"
  value "ROLLER_SHADES", value: "Roller Shades"
  value "SLATTED_BLINDS", value: "Slatted Blinds"
end
