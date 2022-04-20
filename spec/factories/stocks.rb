FactoryBot.define do
  factory :stock do
    id { 1 }
    slug { 'bitcoin' }
    symbol { 'btc' }
    name { 'Bitcoin' }
    max_supply { 21_000_000 }
    image {"https://correctformat.com"}
  end
end
