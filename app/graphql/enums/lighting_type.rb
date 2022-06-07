class Enums::LightingType < Enums::BaseEnum
  graphql_name "LightingType"

  description "Kinds and qualities of light that can be emitted by certain items."

  value "CANDLE", value: "Candle"
  value "EMISSION", value: "Emission"
  value "FLUORESCENT", value: "Fluorescent"
  value "MONITOR", value: "Monitor"
  value "SHADE", value: "Shade"
  value "SPOTLIGHT", value: "Spotlight"
end
