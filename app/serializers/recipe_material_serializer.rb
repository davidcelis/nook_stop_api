class RecipeMaterialSerializer < Blueprinter::Base
  association :item, blueprint: ->(item) {
    case item
      when Item then ItemSerializer
      when Insect then InsectSerializer
      when Fish then FishSerializer
      when SeaCreature then SeaCreatureSerializer
    end
  }

  field :count
end
