class Enums::CustomizationKitType < Enums::BaseEnum
  graphql_name "CustomizationKitType"

  value "NORMAL", description: "Can be customized using normal customization kits.", value: "Normal"
  value "RAINBOW_FEATHER", description: "Can be customized using rainbow feathers acquired during Festivale.", value: "Rainbow feather"
  value "PUMPKIN", description: "Can be customized using orange pumpkins grown in the Fall.", value: "Pumpkin"
end
