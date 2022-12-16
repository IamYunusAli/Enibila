class RecipesController < ApplicationController
  def index
    @recipes = current_user.recipes
  end

  def show
    recipe_test = Recipe.find(params[:id])
    return redirect_to recipes_path unless recipe_test.user == current_user

    @recipe = Recipe.find(params[:id])
    @recipe_foods = RecipeFood.where(recipe_id: @recipe.id).includes(:food, :recipe)
  end

  def destroy
    recipe = Recipe.find(params[:id])
    return flash[:alert] = 'Access Denied.' unless recipe.user == current_user

    flash[:notice] = 'Recipe deleted.' if recipe.destroy
    redirect_back(fallback_location: root_path)
  end

  def create
    recipe = current_user.recipes.new(recipe_params)
    redirect_to recipes_path if recipe.save
  end

  def new
    @recipe = Recipe.new
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :preparation_time, :cooking_time, :description, :public)
  end
end
