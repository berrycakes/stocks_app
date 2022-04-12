FactoryBot.define do
  factory :user do
    id { 1 }
    email { 'juan@email.com' }
    password { 'password' }
    confirmed_at { Time.now }
    role { 1 }
  end
end
