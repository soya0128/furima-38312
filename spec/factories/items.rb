FactoryBot.define do
  factory :item do
    name               {Faker::Name.name}
    text               {Faker::Lorem.sentence}
    category_id        {Faker::Number.between(from: 2, to: 11)}
    condition_id       {Faker::Number.between(from: 2, to: 7)}
    delivery_charge_id {Faker::Number.between(from: 2, to: 3)}
    prefecture_id      {Faker::Number.between(from: 2, to: 48)}
    delivery_day_id    {Faker::Number.between(from: 2, to: 4)}
    price              {Faker::Number.between(from: 300, to: 9999999)}
    association :user

    after(:build) do |item|
      item.images.attach(io: File.open('public/images/glass_shoes.png'),filename: 'glass_shoes.png')
    end
  end
end

