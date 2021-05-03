FactoryBot.define do
  factory :part do
    name { Faker::Lorem.sentence }
    number { Faker::Lorem.sentence }
    category_id { Faker::Number.between(from: 2, to: 3)} 
    material { Faker::Lorem.sentence }
    price { Faker::Number.number(digits: 5)}
    supplier_id { Faker::Number.between(from: 2, to: 5)}
    association :user
    
    after(:build) do |part|
      part.image.attach(io: File.open('public/images/test_image.jpg'), filename: 'test_image.jpg')
    end
  end
end
