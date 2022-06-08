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
        ::Item.find_by!(shared_internal_id: id)
      elsif name.present?
        ::Item.where("lower(name) = ?", name).first!
      end
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
        ::Creature.find_by!(shared_internal_id: id)
      elsif name.present?
        ::Creature.where("lower(name) = ?", name).first!
      end
    end
  end
end
