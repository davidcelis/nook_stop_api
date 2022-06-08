class Objects::Transaction < Objects::BaseObject
  description "This type represents a monetary transaction performed at the Nook Link terminal."

  field :balance, Integer, null: false, description: "Your new account balance."
  field :transaction_id, String, null: false, description: "A unique Transaction ID for your records. Consider this to be a kind of receipt."
end
