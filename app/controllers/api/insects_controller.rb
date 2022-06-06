module API
  class InsectsController < BaseController
    def index
      pagy, insects = pagy(Insect.all)
      pagy_headers_merge(pagy)

      render json: InsectSerializer.render_as_hash(insects)
    end

    def show
      insect = Insect.find_by!(unique_internal_id: params[:id])

      render json: InsectSerializer.render_as_hash(insect)
    end
  end
end
