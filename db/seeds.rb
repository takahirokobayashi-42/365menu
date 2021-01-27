# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.find_or_create_by(id: 1) do |admin|
  admin.email = 'admin@example.com'
  admin.password = 'password'
end

require "csv"
CSV.foreach('db/category.csv', encoding: 'Shift_JIS:UTF-8', headers: true) do |row|
  Category.create(
    name: row['name']
  )
end

CSV.foreach('db/foodstuff.csv', headers: true) do |row|
  Foodstuff.create(
    category_id: row['category_id'],
    name: row['name'],
    calory: row['calory'],
    protein: row['protein'],
    carbohydrate: row['carbohydrate'],
    fat: row['fat']
  )
end

CSV.foreach('db/genre.csv', headers: true) do |row|
  Genre.create(
    name: row['name']
  )
end

CSV.foreach('db/menu-genre.csv', headers: true) do |row|
  MenuGenre.create(
    name: row['name']
  )
end