require 'json'
require 'open-uri'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts 'destroy all data'

Cocktail.destroy_all
Ingredient.destroy_all


url = "https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"
parsing = open(url).read
data = JSON.parse(parsing)


data["drinks"].each do |drink|
  Ingredient.create!(name: drink["strIngredient1"])
end

# creating cocktails

Cocktail.create(name: "Bloody mary")
Cocktail.create(name: "russian")
Cocktail.create(name: "mojito")

puts "Creating cocktails : #{Cocktail.all.size} / 3"
