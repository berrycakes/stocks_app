FactoryBot.define do
  factory :wallet_transaction do
    transaction_type { 'Deposit' }
    amount { 1000 }
    wallet
  end
end
