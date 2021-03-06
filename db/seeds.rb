# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Item.destroy_all
Cart.destroy_all
Order.destroy_all

u = User.create(email: "testo0@yopmail.com", password: "testoto", is_admin: true)  

20.times do |index|
  i = Item.create(title: Faker::Name.name, description: Faker::Movie.quote, price: Faker::Number.between(from: 5.00, to: 50.00), image_url: "lien_image_#{index}")  
end