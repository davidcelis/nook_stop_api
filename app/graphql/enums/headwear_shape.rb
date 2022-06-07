class Enums::HeadwearShape < Enums::BaseEnum
  description "An identifier used to determine how headwear looks when worn."

  value "CAP", description: "Looks like a cap.", value: "HeadCap"
  value "FACE", description: "Partially covers the face.", value: "HeadFace"
  value "FULL_FACE", description: "Completely covers the face.", value: "HeadFullFace"
  value "HAIR_ORNAMENT_BACK", description: "Is a hair ornament worn in back.", value: "HeadHairOrnament_Back"
  value "HAIR_ORNAMENT_FRONT", description: "Is a hair ornament worn in front.", value: "HeadHairOrnament_Front"
  value "HAIR_ORNAMENT_LEFT", description: "Is a hair ornament worn on the left side.", value: "HeadHairOrnament_Left"
  value "HAIR_ORNAMENT_PEAK", description: "Is a hair ornament worn on the peak of the head.", value: "HeadHairOrnament_Peak"
  value "HAIR_ORNAMENT_TOP", description: "Is a hair ornament worn on the top of the head.", value: "HeadHairOrnament_Top"
  value "HEADGEAR_BANGS", description: "Mostly encloses the head, but shows the player's bangs.", value: "Headgear_HasBang"
  value "HEADGEAR_EARS", description: "Mostly encloses the head, but shows the player's ears.", value: "Headgear_HasEar"
  value "HEADGEAR_NO_EARS", description: "Encloses the head and hides the player's ears.", value: "Headgear_NoEar"
  value "HEADGEAR_NO_EARS_NO_JAW", description: "Encloses the head and hides the player's ears and jawline.", value: "Headgear_NoEarNoJaw"
end
