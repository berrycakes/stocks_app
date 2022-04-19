FactoryBot.define do
  factory :user do
    id { 1 }
    email { 'juan@email.com' }
    password { 'password' }
    confirmed_at { Time.now }
    role { 1 }
  end

  factory :admin, class: 'User' do
    id { 2 }
    email { 'adminn@email.com' }
    password { 'password' }
    confirmed_at { Time.now }
    role { 0 }
  end
end
