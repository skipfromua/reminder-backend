FactoryBot.define do
  factory :todo_list do
    memo { Faker::Lorem.sentence(word_count: 5) }
    event
  end
end
