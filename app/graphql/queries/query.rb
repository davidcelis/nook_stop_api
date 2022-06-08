module Queries
  class Query < Objects::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    field :item, Interfaces::Item, null: false, description: "Returns a single item by name." do
      argument :name, String, required: true, description: "The name of the item."
    end
    def item(name:)
      dataloader.with(Sources::ObjectByColumn, Item, :name).load(name).tap do |item|
        raise ActiveRecord::RecordNotFound unless item.present?
      end
    end

    field :items, Interfaces::Item.connection_type, null: false, description: "Returns a paginated list of items."
    def items
      Item.all
    end

    field :storage, [Objects::StoredItem], null: false, description: "Returns a list of items you currently have in storage."
    def storage
      ids = JSON.parse(context[:account][:storage])

      dataloader.with(Sources::ObjectByColumn, ::ItemVariant, :id).load_all(ids)
    end

    field :recipe, Objects::Recipe, null: false, description: "Returns a single recipe by the name of the crafted item." do
      argument :name, String, required: true, description: "The name of the crafted item."
    end
    def recipe(name:)
      item = dataloader.with(Sources::ObjectByColumn, Item, :name).load(name)
      raise ActiveRecord::RecordNotFound unless item.present?

      dataloader.with(Sources::ObjectByColumn, Recipe, :item_id).load(item.id).tap do |recipe|
        raise ActiveRecord::RecordNotFound unless recipe.present?
      end
    end

    field :recipes, Objects::Recipe.connection_type, null: false, description: "Returns a paginated list of recipes."
    def recipes
      Recipe.all
    end

    field :creature, Interfaces::Creature, null: false, description: "Returns a single creature by name." do
      argument :name, String, required: false, description: "The name of the creature."
    end
    def creature(name:)
      dataloader.with(Sources::ObjectByColumn, Creature, :name).load(name).tap do |creature|
        raise ActiveRecord::RecordNotFound unless creature.present?
      end
    end

    field :fish, Objects::Fish.connection_type, null: false, description: "Returns a paginated list of fish."
    def fish
      Fish.all
    end

    field :insects, Objects::Insect.connection_type, null: false, description: "Returns a paginated list of insects."
    def insects
      Insect.all
    end

    field :sea_creatures, Objects::SeaCreature.connection_type, null: false, description: "Returns a paginated list of sea creatures."
    def sea_creatures
      SeaCreature.all
    end

    field :villager, Objects::Villager, null: false, description: "Returns a single villager by name." do
      argument :name, String, required: true, description: "The name of the villager. This argument is case sensitive."
    end
    def villager(name:)
      dataloader.with(Sources::ObjectByColumn, Villager, :name).load(name).tap do |villager|
        raise ActiveRecord::RecordNotFound unless villager.present?
      end
    end

    field :villagers, Objects::Villager.connection_type, null: false, description: "Returns a paginated list of villagers."
    def villagers
      Villager.all
    end
  end
end
