module Objects
  class BaseObject < GraphQL::Schema::Object
    edge_type_class(Edges::BaseEdge)
    connection_type_class(Connections::BaseConnection)
    field_class Fields::BaseField
  end
end
