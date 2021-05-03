FactoryBot.define do
  factory :product do
    name { Faker::Lorem.sentence }
    association :user
  end
end
