module API
  class RecipesController < BaseController
    def index
      pagy, recipes = pagy(Recipe.includes(materials: :item))
      pagy_headers_merge(pagy)

      render json: RecipeSerializer.render_as_hash(recipes, serializer_options)
    end

    def show
      recipe = Recipe.includes(materials: :item).find_by!(unique_internal_id: params[:id])

      render json: RecipeSerializer.render_as_hash(recipe, serializer_options)
    end

    def materials
      recipe = Recipe.includes(materials: :item).find_by!(unique_internal_id: params[:id])

      render json: RecipeMaterialSerializer.render_as_hash(recipe.materials)
    end

    private

    def serializer_options
      {}.tap do |options|
        options[:view] = :extended if ActiveModel::Type::Boolean.new.cast(params[:extended])
      end
    end
  end
end
