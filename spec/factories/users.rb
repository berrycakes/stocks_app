FactoryBot.define do
  factory :user do
    password { 'password' }
    confirmed_at { Time.now }

    trait :admin do
      id { 2 }
      email { 'admin@email.com' }
      role { 0 }
    end

    trait :trader do
      id { 1 }
      email { 'juan@email.com' }
      role { 1 }
    end

    trait :approved do
      after(:create) do |user|
        user.trader.approved = true
        user.trader.wallet.balance = 100_000
        user.trader.wallet.save
        user.save
        user.reload
      end
    end
  end
end
