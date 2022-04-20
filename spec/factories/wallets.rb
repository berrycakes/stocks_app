FactoryBot.define do
  factory :wallet do
    id { 1 }
    balance { 100_000 }
    trader
  end
end
