class Enums::SpeakerType < Enums::BaseEnum
  graphql_name "SpeakerType"

  description "The quality of sound played by items that can act as music players."

  value "HI_FI", description: "Studio quality, the highest quality.", value: "Hi-fi"
  value "RETRO", description: "\"Retro\" quality, which is slightly lower quality than `HI_FI`.", value: "Retro"
  value "CHEAP", description: "Cheap quality, which is a low quality, tinny sound.", value: "Cheap"
  value "MUSIC_BOX", description: "Plays a sound quality like a music box.", value: "Music Box"
  value "PHONO", description: "Plays like an old-school record player, with a muffled quality and added pitch wobble and static effects.", value: "Phono"
end
