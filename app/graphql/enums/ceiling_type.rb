class Enums::CeilingType < Enums::BaseEnum
  graphql_name "CeilingType"

  description "Ceiling types that can come with certain wallpaper."

  value "CLOTH", value: "Cloth"
  value "GOLD", value: "Gold"
  value "PLAIN", value: "Plain"
  value "STONE", value: "Stone"
  value "TILE", value: "Tile"
  value "WOOD", value: "Wood"
end
