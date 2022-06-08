class Unions::StorableItem < Unions::BaseUnion
  description "Items which may be kept in storage."

  possible_types(
    Objects::Accessory,
    Objects::Artwork,
    Objects::Bag,
    Objects::Bottom,
    Objects::CeilingDecor,
    Objects::DressUp,
    Objects::Fencing,
    Objects::Fish,
    Objects::Flooring,
    Objects::Fossil,
    Objects::Gyroid,
    Objects::HandheldItem,
    Objects::Headwear,
    Objects::Houseware,
    Objects::Insect,
    Objects::InteriorStructure,
    Objects::ItemVariant,
    Objects::MiscellaneousFurniture,
    Objects::Music,
    Objects::OtherItem,
    Objects::Rug,
    Objects::SeaCreature,
    Objects::Shoes,
    Objects::Socks,
    Objects::Top,
    Objects::Umbrella,
    Objects::VillagerPhoto,
    Objects::VillagerPoster,
    Objects::WallMountedFurniture,
    Objects::Wallpaper,
    Objects::Wetsuit
  )
end
