FactoryBot.define do
  factory :notification do
    enabled { true }
    start_notifying_days_before { 5 }
    notifying_at { ['10:00', '20:00'] }
    event
  end
end
