module API
  class SeaCreaturesController < BaseController
    def index
      pagy, sea_creatures = pagy(SeaCreature.all)
      pagy_headers_merge(pagy)

      render json: SeaCreatureSerializer.render_as_hash(sea_creatures)
    end

    def show
      sea_creature = SeaCreature.find_by!(unique_internal_id: params[:id])

      render json: SeaCreatureSerializer.render_as_hash(sea_creature)
    end
  end
end
