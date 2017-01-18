# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
if Rails.env.development?
  Category.create(name: "Documentary")
  Category.create(name: "Politics")
  Category.create(name: "Comedy")
  Category.create(name: "Programming")
  Category.create(name: "Advice")
  Category.create(name: "Feminist")
  Category.create(name: "Educational")
  Category.create(name: "Science fiction")
  Category.create(name: "Horror")
  Category.create(name: "Fiction")
  Category.create(name: "News")
  Category.create(name: "History")
  Category.create(name: "Sports")
  Category.create(name: "Movies")
  Category.create(name: "Pop culture")
  Category.create(name: "Religion")
  Category.create(name: "Music")
  Category.create(name: "Economics")
  Category.create(name: "Psychology")
  Category.create(name: "Interviews")
  Category.create(name: "Tech")
end
