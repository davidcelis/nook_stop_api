module Queries
  class Query < Objects::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # Add root-level fields here.
    # They will be entry points for queries on your schema.
    field :item, Interfaces::Item, null: false, description: "Returns a single item by internal ID." do
      argument :id, Integer, required: true, description: "The ID of the item used internally by Animal Crossing."
    end
    def item(id:)
      ::Item.find_by!(shared_internal_id: id)
    end
  end
end
