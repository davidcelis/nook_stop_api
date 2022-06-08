class Enums::CraftedItemType < Enums::BaseEnum
  graphql_name "CraftedItemType"

  description "A list of item types that can be crafted with DIY Recipes."

  value "CEILING_DECOR", value: "Ceiling Decor"
  value "EQUIPMENT", value: "Equipment"
  value "FLOORS", value: "Floors"
  value "HOUSEWARES", value: "Housewares"
  value "MISCELLANEOUS", value: "Miscellaneous"
  value "OTHER", value: "Other"
  value "RUGS", value: "Rugs"
  value "SAVORY_FOOD", value: "Savory"
  value "SWEET_FOOD", value: "Sweet"
  value "TOOLS", value: "Tools"
  value "WALL_MOUNTED", value: "Wall-mounted"
  value "WALLPAPER", value: "Wallpaper"
end
