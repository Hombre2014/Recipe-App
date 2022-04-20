class ShoppingListsController < ApplicationController
  def index
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_foods = RecipeFood.all
    @food = Food.all
    @total_price = current_user.sum(@recipe.recipe_foods.includes([:food]))
  end
end
