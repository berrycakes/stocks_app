FactoryBot.define do
  factory :trader do
    id { 1 }
    first_name { 'Juan' }
    last_name { 'Cruz' }
    mobile_number { '111-222' }
    association :user, :trader

    trait :approved do
      approved { true }
    end

    after(:create) do |trader|
      trader.build_wallet(id: 1, balance: 0)
      trader.wallet.wallet_transactions.build(attributes_for(:wallet_transaction))
      trader.save
      trader.reload
    end
  end
end
