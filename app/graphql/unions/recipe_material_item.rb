class Unions::RecipeMaterialItem < Unions::BaseUnion
  description "Items which may be used to craft a recipe."

  possible_types(
    Objects::CeilingDecor,
    Objects::DressUp,
    Objects::Fish,
    Objects::Flooring,
    Objects::Houseware,
    Objects::MiscellaneousFurniture,
    Objects::OtherItem,
    Objects::SeaCreature,
    Objects::HandheldItem,
    Objects::WallMountedFurniture,
    Objects::Wallpaper
  )
end
