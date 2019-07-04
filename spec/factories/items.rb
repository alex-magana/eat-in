FactoryBot.define do
  factory :item do
    name { Faker::Food.dish }
    price { Faker::Number.decimal(4, 3) }
    available { Faker::Boolean.boolean }
  end
end

