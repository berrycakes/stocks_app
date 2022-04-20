FactoryBot.define do
  factory :wallet_transaction do
    transaction_type { 'Deposit' }
    amount { 100_000 }
    wallet
  end
end
