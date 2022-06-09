class NookStopAPISchema < GraphQL::Schema
  mutation(Mutations::Mutation)
  query(Queries::Query)

  default_page_size(Pagy::DEFAULT[:items])
  default_max_page_size(Pagy::DEFAULT[:max_items])

  # For batch-loading (see https://graphql-ruby.org/dataloader/overview.html)
  use GraphQL::Dataloader

  # Define types that aren't reachable via introspection
  orphan_types()

  rescue_from(ActiveRecord::RecordNotFound) do |err, obj, args, ctx, field|
    # Raise a graphql-friendly error with a custom message
    raise GraphQL::ExecutionError, "#{field.type.unwrap.graphql_name} not found"
  end

  # GraphQL-Ruby calls this when something goes wrong while running a query:
  def self.type_error(err, context)
    # if err.is_a?(GraphQL::InvalidNullError)
    #   # report to your bug tracker here
    #   return nil
    # end
    super
  end

  # Union and Interface Resolution
  def self.resolve_type(abstract_type, obj, ctx)
    case obj
    when Item
      resolve_item_type(abstract_type, obj, ctx)
    when ItemVariant
      Objects::ItemVariant
    when Recipe
      Objects::Recipe
    when Fish
      Objects::Fish
    when Insect
      Objects::Insect
    when SeaCreature
      Objects::SeaCreature
    when Villager
      Objects::Villager
    end
  end

  def self.resolve_item_type(abstract_type, obj, ctx)
    case obj.category
      when "Housewares" then Objects::Houseware
      when "Miscellaneous" then Objects::MiscellaneousFurniture
      when "Wall-mounted" then Objects::WallMountedFurniture
      when "Ceiling Decor" then Objects::CeilingDecor
      when "Interior Structures" then Objects::InteriorStructure
      when "Wallpaper" then Objects::Wallpaper
      when "Floors" then Objects::Flooring
      when "Rugs" then Objects::Rug
      when "Photos" then Objects::VillagerPhoto
      when "Posters" then Objects::VillagerPoster
      when "Tools/Goods" then Objects::HandheldItem
      when "Fencing" then Objects::Fencing
      when "Tops" then Objects::Top
      when "Bottoms" then Objects::Bottom
      when "Dress-Up" then Objects::DressUp
      when "Headwear" then Objects::Headwear
      when "Accessories" then Objects::Accessory
      when "Socks" then Objects::Socks
      when "Shoes" then Objects::Shoes
      when "Bags" then Objects::Bag
      when "Umbrellas" then Objects::Umbrella
      when "Clothing Other" then Objects::Wetsuit
      when "Music" then Objects::Music
      when "Fossils" then Objects::Fossil
      when "Artwork" then Objects::Artwork
      when "Gyroids" then Objects::Gyroid
      when "Other" then Objects::OtherItem
    end
  end

  # Relay-style Object Identification:

  # Return a string UUID for `object`
  def self.id_from_object(object, type_definition, query_ctx)
    # For example, use Rails' GlobalID library (https://github.com/rails/globalid):
    object.to_gid_param
  end

  # Given a string UUID, find the object
  def self.object_from_id(global_id, query_ctx)
    # For example, use Rails' GlobalID library (https://github.com/rails/globalid):
    GlobalID.find(global_id)
  end
end
