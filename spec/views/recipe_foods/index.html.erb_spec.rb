require 'rails_helper'

RSpec.describe 'recipe #show', type: :feature do
  before(:all) do
    user = User.create!(name: 'Yunus Ali', email: 'Yunus@gmail.com', password: '123456789')
    login_as(user, scope: :user)
    @food1 = Food.create(name: 'Nyama choma', measurement_unit: 'Kilogrammes', price: 800, quantity: 1)
    @food2 = Food.create(name: 'Chips', measurement_unit: 'Pounds', price: 150, quantity: 0.5)
    @food3 = Food.create(name: 'Banana bread', measurement_unit: 'Kilogrammes', price: 1000, quantity: 4)
    recipe1 = Recipe.create(user:, name: 'Recipe 1', preparation_time: 60, cooking_time: 30,
                            description: 'Lorem ipsum text', public: true)
    @recipe2 = Recipe.create(name: 'Recipe 2', preparation_time: 30, cooking_time: 15,
                             description: 'Lorem ipsum text', public: false)
    @recipe3 = Recipe.create(name: 'Recipe 3', preparation_time: 120, cooking_time: 90,
                             description: 'Lorem ipsum text', public: true)
    @recipe4 = Recipe.create(name: 'Recipe 4', preparation_time: 60, cooking_time: 30,
                             description: 'Lorem ipsum text', public: false)
    @recipe_food1 = RecipeFood.create(recipe_id: recipe1.id, food_id: @food1.id)
    @recipe_food2 = RecipeFood.create(recipe_id: recipe1.id, food_id: @food2.id)
    @recipe_food3 = RecipeFood.create(recipe_id: recipe1.id, food_id: @food3.id)
    @recipe_food4 = RecipeFood.create(recipe_id: @recipe2.id, food_id: @food1.id)

    @recipe_all = Recipe.all
    visit "/recipes/#{recipe1.id}"
  end

  it 'expected to have name' do
    expect(page).to have_content('Yunus Ali')
  end
end
