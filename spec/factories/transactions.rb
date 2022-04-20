FactoryBot.define do
  factory :transaction do
    id { 1 }
    stock_share { 5 }
    price { 5000 }
    transaction_type { 'buy' }
    date { Time.now }
    stock
    trader
  end
end
