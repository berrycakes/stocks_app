FactoryBot.define do
  factory :wallet do
    id { 1 }
    balance { 0 }
    trader
  end
end
