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
  end
end
