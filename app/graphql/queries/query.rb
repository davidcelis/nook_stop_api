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
      argument :name, String, required: true, description: "The name of the creature."
    end
    def creature(name:)
      dataloader.with(Sources::ObjectByColumn, Creature, :name).load(name).tap do |creature|
        raise ActiveRecord::RecordNotFound unless creature.present?
      end
    end

    field :fish, Objects::Fish.connection_type, null: false, description: "Returns a paginated list of fish." do
      argument :available_now, Boolean, required: false, description: "If provided, allows you to filter by fish that can be caught right at this very moment."
      argument :hemisphere, Enums::Hemisphere, required: false, description: "Should be provided along with `availableNow` to specify where you're looking. Defaults to `NORTHERN`.", default_value: "northern"
    end
    def fish(available_now: nil, hemisphere: "northern")
      if available_now
        Fish.available_now(hemisphere: hemisphere)
      else
        Fish.all
      end
    end

    field :insects, Objects::Insect.connection_type, null: false, description: "Returns a paginated list of insects." do
      argument :available_now, Boolean, required: false, description: "If provided, allows you to filter by insects that can be caught right at this very moment. If set to `false`, all creatures will be included."
      argument :hemisphere, Enums::Hemisphere, required: false, description: "Should be provided along with `availableNow` to specify where you're looking. Defaults to `NORTHERN`.", default_value: "northern"
    end
    def insects(available_now: nil, hemisphere: "northern")
      if available_now
        Insect.available_now(hemisphere: hemisphere)
      else
        Insect.all
      end
    end

    field :sea_creatures, Objects::SeaCreature.connection_type, null: false, description: "Returns a paginated list of sea creatures." do
      argument :available_now, Boolean, required: false, description: "If provided, allows you to filter by sea creatures that can be caught right at this very moment. If set to `false`, all creatures will be included."
      argument :hemisphere, Enums::Hemisphere, required: false, description: "Should be provided along with `availableNow` to specify where you're looking. Defaults to `NORTHERN`.", default_value: "northern"
    end
    def sea_creatures(available_now: nil, hemisphere: "northern")
      if available_now
        SeaCreature.available_now(hemisphere: hemisphere)
      else
        SeaCreature.all
      end
    end

    field :villager, Objects::Villager, null: false, description: "Returns a single villager by name." do
      argument :name, String, required: true, description: "The name of the villager. This argument is case sensitive."
    end
    def villager(name:)
      dataloader.with(Sources::ObjectByColumn, Villager, :name).load(name).tap do |villager|
        raise ActiveRecord::RecordNotFound unless villager.present?
      end
    end

    field :villagers, Objects::Villager.connection_type, null: false, description: "Returns a paginated list of villagers." do
      argument :species, Enums::Species, required: false, description: "The species of villager you would like to filter by, if any."
    end
    def villagers(species: nil)
      if species
        Villager.where(species: species)
      else
        Villager.all
      end
    end

    field :storage, Connections::StorageConnection, null: false, description: "Returns a list of items you currently have in storage."
    def storage
      JSON.parse(context[:account][:storage])
    end

    field :balance, Integer, null: false, description: "Returns your current account balance in Bells."
    def balance
      context[:account][:bells]
    end
  end
end
