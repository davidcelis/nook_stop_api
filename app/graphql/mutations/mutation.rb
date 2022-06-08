module Mutations
  class Mutation < Objects::BaseObject
    field :deposit, mutation: Mutations::Deposit
    field :withdraw, mutation: Mutations::Withdraw

    field :purchase, mutation: Mutations::Purchase
  end
end
