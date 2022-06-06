module API
  class ItemsController < BaseController
    def index
      pagy, items = pagy(Item.includes(:variants))
      pagy_headers_merge(pagy)

      render json: ItemSerializer.render_as_hash(items, serializer_options)
    end

    def show
      item = Item.find_by!(shared_internal_id: params[:id])

      render json: ItemSerializer.render_as_hash(item, serializer_options)
    end

    def variants
      item = Item.find_by!(shared_internal_id: params[:id])

      render json: ItemVariantSerializer.render_as_hash(item.variants)
    end

    private

    def serializer_options
      {}.tap do |options|
        options[:view] = :extended if ActiveModel::Type::Boolean.new.cast(params[:extended])
      end
    end
  end
end
