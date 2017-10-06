# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'Seeding User records'

User.create(email: "john@hotmail.com", password: "123456", username: "john", address: "New York City 5th Avenue")

puts 'Seeding Basket records'

Basket.create(user_id: 1)

puts 'Seeding Products records'

Product.create(name: "shirt1", description: "Hush Puppies", price: 0.1e3, gender: "male", category: "shirts", quantity: 10)
Product.create(name: "Baggy Shorts", description: "Giordano", price: 0.3e2, gender: "male", category: "shorts", quantity: 10)

puts 'Seeding Items_Basket records'

ItemsBasket.create(basket_id: 1, product_id: 1, quantity: 2)
ItemsBasket.create(basket_id: 1, product_id: 2, quantity: 4)
