class Enums::AccessoryShape < Enums::BaseEnum
  description "An identifier used to determine how an accessory looks when worn."

  value "EYE_MOUTH", description: "Covers the eyes and mouth.", value: "AcceEyeMouth"
  value "EYE", description: "Covers the eyes.", value: "AccessoryEye"
  value "EYE_MOUTH_INVISIBLE_NOSE", description: "Covers the eyes, mouth, and nose.", value: "AccessoryEyeMouthInvisibleNose"
  value "MOUTH", description: "Covers the mouth.", value: "AccessoryMouth"
  value "MOUTH_EAR_JAW", description: "Covers the mouth, ears, and jawline.", value: "AccessoryMouthEarJaw"
  value "MOUTH_INVISIBLE_NOSE", description: "Covers the mouth and nose.", value: "AccessoryMouthInvisibleNose"
  value "ONE_EYE", description: "Covers one eye.", value: "AccessoryOneEye"
end
