# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# seeds for 50 records
50.times do
  restaurant = Restaurant.create(
    name: Faker::Restaurant.unique.name,
    opening_time: Faker::Number.within(8..12),
    closing_time: Faker::Number.within(13..23),
    created_by: User.first.id
  )
  restaurant.items.create(
    name: Faker::Food.dish,
    price: Faker::Number.decimal(4, 3),
    available: Faker::Boolean.boolean
  )
end
