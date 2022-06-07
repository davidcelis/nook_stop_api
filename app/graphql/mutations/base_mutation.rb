module Mutations
  class BaseMutation < GraphQL::Schema::RelayClassicMutation
    argument_class Arguments::BaseArgument
    field_class Fields::BaseField
    input_object_class InputObjects::BaseInputObject
    object_class Objects::BaseObject
  end
end
