# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'json'
require 'open-uri'
require 'faker'

Cocktail.destroy_all
Ingredient.destroy_all
Dose.destroy_all


url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
user_serialized = open(url).read
ingredients = JSON.parse(user_serialized)

ingredients["drinks"].each do |ingredient|
  new_ingredient = Ingredient.create(name: ingredient["strIngredient1"])
end

10.times do
  new_cocktail = Cocktail.create(name: Faker::Beer.name)
  rand(3...5).times do
    inclusive_ing = Ingredient.all.sample
    new_dose = Dose.create(
      cocktail_id: new_cocktail.id,
      ingredient_id: inclusive_ing.id,
      description: "#{(rand(1...4)).to_s}cc  #{inclusive_ing.name}")
  end
end
