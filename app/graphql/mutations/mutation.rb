module Mutations
  class Mutation < Objects::BaseObject
    field :deposit, mutation: Mutations::Deposit
    field :withdraw, mutation: Mutations::Withdraw
  end
end
