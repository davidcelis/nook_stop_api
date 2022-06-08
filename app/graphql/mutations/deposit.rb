class Mutations::Deposit < Mutations::BaseMutation
  description "Deposits the specified number of bells into your account."

  input_object_class InputObjects::TransactionInput
  object_class Objects::Transaction

  def resolve(bells:)
    raise GraphQL::ExecutionError, "You must deposit at least 1 Bell." if bells <= 0

    context[:account][:bells] += bells

    OpenStruct.new(
      balance: context[:account][:bells],
      transaction_id: SecureRandom.uuid
    )
  end
end
