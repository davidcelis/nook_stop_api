module API
  class VillagersController < BaseController
    INCLUDES = {
      favorite_song: :item,
      default_top: :item,
      default_umbrella: :item,
      default_wallpaper: :item,
      default_flooring: :item,
      default_workbench: :item,
      default_kitchen_equipment: :item,
      default_items: :item
    }

    def index
      pagy, villagers = pagy(Villager.includes(INCLUDES))
      pagy_headers_merge(pagy)

      render json: VillagerSerializer.render_as_hash(villagers, serializer_options)
    end

    def show
      villager = Villager.includes(INCLUDES).find(params[:id])

      render json: VillagerSerializer.render_as_hash(villager, serializer_options)
    end

    def default_furniture
      villager = Villager.includes(INCLUDES).find(params[:id])

      render json: DefaultItemSerializer.render_as_hash(villager.default_items)
    end

    private

    def serializer_options
      {}.tap do |options|
        options[:view] = :extended if ActiveModel::Type::Boolean.new.cast(params[:extended])
      end
    end
  end
end
