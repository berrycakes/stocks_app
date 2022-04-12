FactoryBot.define do
  factory :transaction do
    id { 1 }
    stock_share { 5 }
    price { 10 }
    transaction_type { 'buy' }
    stock
    trader
  end
end
