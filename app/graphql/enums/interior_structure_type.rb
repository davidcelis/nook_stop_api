class Enums::InteriorStructureType < Enums::BaseEnum
  graphql_name "InteriorStructureType"

  value "COUNTER", value: "Counter"
  value "PARTITION", value: "FtrWall"
  value "PILLAR", value: "Pillar"
end
