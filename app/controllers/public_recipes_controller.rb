class PublicRecipesController < ApplicationController
  def index
    @recipes = Recipe.includes(:recipe_foods, :foods).order(created_at: :desc)
    @public_recipes = @recipes.select(&:public)

    @total_price = []
    @public_recipes.each do |recipe|
      total = 0
      recipe.recipe_foods.each do |recipe_food|
        total += recipe_food.food.price * recipe_food.quantity
      end
      @total_price.push(total)
    end
  end
end
