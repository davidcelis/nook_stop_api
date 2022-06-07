module Unions
  class BaseUnion < GraphQL::Schema::Union
    edge_type_class(Edges::BaseEdge)
    connection_type_class(Connections::BaseConnection)
  end
end
