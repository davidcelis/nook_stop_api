module API
  class BaseController < ApplicationController
    include Pagy::Backend

    rescue_from ActiveRecord::RecordNotFound do |e|
      render json: { error: "not_found", message: e.message }, status: 404
    end
  end
end
