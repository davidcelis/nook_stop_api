class Enums::GyroidSoundType < Enums::BaseEnum
  graphql_name "GyroidSoundType"

  description "The types of sound that can be played by a Gyroid when interacted with."

  value "CRASH", value: "Crash"
  value "DRUM_SET", value: "Drum set"
  value "HI_HAT", value: "Hi-hat"
  value "KICK", value: "Kick"
  value "MELODY", value: "Melody"
  value "SNARE", value: "Snare"
end
