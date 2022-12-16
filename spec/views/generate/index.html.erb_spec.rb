require 'rails_helper'

RSpec.describe 'generate#index', type: :feature do
  before(:each) do
    @user = User.create!(name: 'William Raga', email: 'raga_0@gmail.com', password: '12345678')
    login_as(@user, scope: :user)
    @food1 = Food.create(name: 'Nyama choma', measurement_unit: 'Kilogrammes', price: 800, quantity: 1)
    @food2 = Food.create(name: 'Chips', measurement_unit: 'Pounds', price: 150, quantity: 0.5)
    @food3 = Food.create(name: 'Banana bread', measurement_unit: 'Kilogrammes', price: 1000, quantity: 4)
    @recipe1 = Recipe.create(name: 'Recipe 1', preparation_time: 60, cooking_time: 30,
                             description: 'Lorem ipsum text', public: true)
    @recipe2 = Recipe.create(name: 'Recipe 2', preparation_time: 30, cooking_time: 15,
                             description: 'Lorem ipsum text', public: false)
    @recipe3 = Recipe.create(name: 'Recipe 3', preparation_time: 120, cooking_time: 90,
                             description: 'Lorem ipsum text', public: true)
    @recipe1 = Recipe.create(name: 'Recipe 4', preparation_time: 60, cooking_time: 30,
                             description: 'Lorem ipsum text', public: false)
    @foods = Food.all

    visit generate_index_path
    # logout(:user)
  end

  it 'Displays current user name' do
    expect(page).to have_content(@user.name)
  end

  it 'Displays the text \'Shopping List\'' do
    expect(page).to have_content('Shopping List')
  end

  it 'Displays the text \'Amount of food items to buy\'' do
    expect(page).to have_content('Amount of food items to buy:')
  end

  it 'Displays the text \'Total value of food needed\'' do
    expect(page).to have_content('Total value of food needed')
  end

  it 'Displays the text \'Food\'' do
    expect(page).to have_content('Food')
  end

  it 'Displays the text \'Quantity\'' do
    expect(page).to have_content('Quantity')
  end

  it 'Displays the text \'Quantity\'' do
    expect(page).to have_content('Quantity')
  end
end
