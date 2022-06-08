module InputObjects
  class TransactionInput < InputObjects::BaseInputObject
    description "Arguments required to make a deposit or withdrawal."

    argument :bells, Integer, required: true, description: "The specified number of bells for this transaction."
  end
end
