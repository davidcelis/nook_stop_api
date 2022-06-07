class Enums::PatternCustomizationOption < Enums::BaseEnum
  value "DEFAULT", description: "Can be customized using the item's default pattern options.", value: "Default"
  value "CUSTOM", description: "Can be customized using patterns developed by the player.", value: "Custom"
  value "SABLE", description: "Can be customized using patterns developed by Sable.", value: "Sable"
end
