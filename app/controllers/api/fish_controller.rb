module API
  class FishController < BaseController
    def index
      pagy, fish = pagy(Fish.all)
      pagy_headers_merge(pagy)

      render json: FishSerializer.render_as_hash(fish)
    end

    def show
      fish = Fish.find_by!(unique_internal_id: params[:id])

      render json: FishSerializer.render_as_hash(fish)
    end
  end
end
