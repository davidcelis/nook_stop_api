module Queries
  class Query < Objects::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    field :item, Interfaces::Item, null: false, description: "Returns a single item by internal ID or name. One and only one must be provided." do
      argument :internal_id, Integer, required: false, description: "The ID of the item used internally by Animal Crossing.", as: :id
      argument :name, String, required: false, description: "The name of the item. This argument is not case sensitive.", prepare: ->(name, _) {
        name.downcase
      }
    end
    def item(id: nil, name: nil)
      if id.present? && name.present?
        raise GraphQL::ExecutionError, "Cannot provide both `internalId` and `name`."
      elsif id.blank? && name.blank?
        raise GraphQL::ExecutionError, "Must provide either `internalId` or `name`."
      end

      if id.present?
        dataloader.with(Sources::ObjectByColumn, Item, :internal_id).load(id)
      elsif name.present?
        Item.where("lower(name) = ?", name).first!
      end
    end

    field :items, Interfaces::Item.connection_type, null: false, description: "Returns a paginated list of items."
    def items
      Item.all
    end

    field :recipe, Objects::Recipe, null: false, description: "Returns a single recipe by internal ID or using the name of the crafted item. One and only one must be provided." do
      argument :internal_id, Integer, required: false, description: "The ID of the recipe used internally by Animal Crossing.", as: :id
      argument :name, String, required: false, description: "The name of the crafted item. This argument is not case sensitive.", prepare: ->(name, _) {
        name.downcase
      }
    end
    def recipe(id: nil, name: nil)
      if id.present? && name.present?
        raise GraphQL::ExecutionError, "Cannot provide both `internalId` and `name`."
      elsif id.blank? && name.blank?
        raise GraphQL::ExecutionError, "Must provide either `internalId` or `name`."
      end

      if id.present?
        dataloader.with(Sources::ObjectByColumn, Recipe, :internal_id).load(id)
      elsif name.present?
        Recipe.joins(:item).where("lower(items.name) = ?", name).first!
      end
    end

    field :recipes, Objects::Recipe.connection_type, null: false, description: "Returns a paginated list of recipes."
    def recipes
      Recipe.all
    end

    field :creature, Interfaces::Creature, null: false, description: "Returns a single creature by internal ID or name. One and only one must be provided." do
      argument :internal_id, Integer, required: false, description: "The ID of the creature used internally by Animal Crossing.", as: :id
      argument :name, String, required: false, description: "The name of the creature. This argument is not case sensitive.", prepare: ->(name, _) {
        name.downcase
      }
    end
    def creature(id: nil, name: nil)
      if id.present? && name.present?
        raise GraphQL::ExecutionError, "Cannot provide both `internalId` and `name`."
      elsif id.blank? && name.blank?
        raise GraphQL::ExecutionError, "Must provide either `internalId` or `name`."
      end

      if id.present?
        dataloader.with(Sources::ObjectByColumn, Creature, :internal_id).load(id)
      elsif name.present?
        Creature.where("lower(name) = ?", name).first!
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
      dataloader.with(Sources::ObjectByColumn, Villager, :name).load(name)
    end

    field :villagers, Objects::Villager.connection_type, null: false, description: "Returns a paginated list of villagers."
    def villagers
      Villager.all
    end
  end
end
