require 'rails_helper'

RSpec.describe 'foods#index', type: :feature do
  before(:each) do
    user = User.create!(name: 'William Raga', email: 'raga_0@gmail.com', password: '12345678')
    login_as(user, scope: :user)
    @food1 = Food.create(name: 'Nyama choma', measurement_unit: 'Kilogrammes', price: 800, quantity: 1)
    @food2 = Food.create(name: 'Chips', measurement_unit: 'Pounds', price: 150, quantity: 0.5)
    @food3 = Food.create(name: 'Banana bread', measurement_unit: 'Kilogrammes', price: 1000, quantity: 4)
    @foods = Food.all

    visit foods_path
    # logout(:user)
  end

  it 'Displays all the foods names' do
    @foods.each do |food|
      expect(page).to have_content(food.name)
    end
  end

  it 'Displays all the foods prices' do
    @foods.each do |food|
      expect(page).to have_content(food.price)
    end
  end

  it 'Displays all the foods quantities' do
    @foods.each do |food|
      expect(page).to have_content(food.quantity)
    end
  end

  it 'Redirects to add food form' do
    click_link 'Add Food'
    expect(current_path).to match new_food_path
  end
end
