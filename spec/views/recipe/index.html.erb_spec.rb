require 'rails_helper'

RSpec.describe 'recipes#index', type: :feature do
  before(:each) do
    user = User.create!(name: 'Yunus Ali', email: 'Yunus@gmail.com', password: '123456789')
    login_as(user, scope: :user)
    @recipe1 = Recipe.create(name: 'Recipe 1', preparation_time: 60, cooking_time: 30,
                             description: 'Lorem ipsum text', public: true)
    @recipe2 = Recipe.create(name: 'Recipe 2', preparation_time: 30, cooking_time: 15,
                             description: 'Lorem ipsum text', public: false)
    @recipe3 = Recipe.create(name: 'Recipe 3', preparation_time: 120, cooking_time: 90,
                             description: 'Lorem ipsum text', public: true)
    @recipe4 = Recipe.create(name: 'Recipe 4', preparation_time: 60, cooking_time: 30,
                             description: 'Lorem ipsum text', public: false)
    @recipes = Recipe.all
    visit recipes_path
  end

  it 'expected to have' do
    expect(page).to have_content('Yunus Ali')
  end

  it 'expected to have and Add button' do
    expect(page).to have_link('Add Recipe')
  end

  it 'Displays all the recipe owners name' do
    @recipes.each do |recipe|
      expect(page).to have_content(recipe.user.name)
    end
  end
end
