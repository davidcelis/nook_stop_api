module Interfaces
  module Node
    include Interfaces::BaseInterface

    # Add the `id` field
    include GraphQL::Types::Relay::NodeBehaviors
  end
end
