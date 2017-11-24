# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!(name: 'Suneel', email: 'suneel@thomaslogistics.com', password: 'thomas123', password_confirmation: 'thomas123', role: 'manager')
User.create!(name: 'Hari Krishna', email: 'hari@thomaslogistics.com', password: 'thomas123', password_confirmation: 'thomas123',role: 'manager')
User.create!(name: 'John Thomas', email: 'john@thomaslogistics.com', password: 'thomas123', password_confirmation: 'thomas123', role: 'manager')
User.create!(name: 'Bhavani',email: 'bhavani@thomaslogistics.com', password: 'thomas123', password_confirmation: 'thomas123', role: 'manager')
