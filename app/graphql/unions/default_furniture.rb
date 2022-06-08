class Unions::DefaultFurniture < Unions::BaseUnion
  description "Types which may be used by Villagers as their default furniture items"

  possible_types(
    Objects::Bottom,
    Objects::Fish,
    Objects::HandheldItem,
    Objects::Houseware,
    Objects::ItemVariant,
    Objects::MiscellaneousFurniture,
    Objects::Music,
    Objects::Rug,
    Objects::Top,
    Objects::VillagerPhoto,
    Objects::VillagerPoster,
    Objects::WallMountedFurniture
  )
end
