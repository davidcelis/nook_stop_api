class Mutations::Withdraw < Mutations::BaseMutation
  description "Withdraws the specified number of bells from your account."

  input_object_class InputObjects::TransactionInput
  object_class Objects::Transaction

  def resolve(bells:)
    raise GraphQL::ExecutionError, "You must withdraw at least 1 Bell." if bells <= 0

    if context[:account][:bells] < bells
      raise GraphQL::ExecutionError, "Oops! Your account balance is #{context[:account][:bells]} Bells, which means it cannot cover your specified withdrawal without overdrafting. Please try again with a smaller amount!"
    end

    context[:account][:bells] -= bells

    OpenStruct.new(
      balance: context[:account][:bells],
      transaction_id: SecureRandom.uuid
    )
  end
end
