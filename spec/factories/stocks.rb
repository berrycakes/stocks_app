FactoryBot.define do
  factory :stock do
    id { 1 }
    slug { 'solana' }
    symbol { 'sol' }
    name { 'Solana' }
    image { 'https://assets.coingecko.com/coins/images/4128/large/solana.png?1640133422' }
    max_supply { nil }
  end
end
