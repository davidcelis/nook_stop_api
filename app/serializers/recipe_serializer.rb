class RecipeSerializer < Blueprinter::Base
  identifier :id do |recipe, _|
    recipe.unique_internal_id
  end

  fields *[
    # Core attributes
    :category,
    :resale_value,
    :image_url,

    # How to acquire the recipe
    :sources,
    :source_notes,
    :total_recipes_to_unlock,
    :price,
    :alternative_currency,
    :alternative_price,
    :seasonal_event,
    :exclusive_to_seasonal_event,

    # Metadata
    :added_in_version
  ]

  view :extended do
    association :item, blueprint: ItemSerializer
    association :materials, blueprint: RecipeMaterialSerializer
  end
end
