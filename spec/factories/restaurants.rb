# Wrapping faker methods in a block ensures that
# faker generates dynamic data every time the factory is invoked

FactoryBot.define do
  factory :restaurant do
    name { Faker::Restaurant.unique.name }
    opening_time { Faker::Number.within(8..12) }
    closing_time { Faker::Number.within(13..23) }
    created_by { Faker::Number.number(10) }
  end
end
