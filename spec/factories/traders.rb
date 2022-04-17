FactoryBot.define do
  factory :trader do
    id { 1 }
    first_name { 'juan' }
    last_name { 'cruz' }
    mobile_number { '111-222' }
    user
  end
end
