FactoryBot.define do
  factory :event do
    name { Faker::Name.first_name }
    date { Date.tomorrow }
    user
  end
end
