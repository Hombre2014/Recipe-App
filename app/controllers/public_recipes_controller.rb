class PublicRecipesController < ApplicationController
  def index
    @recipes = Recipe.includes(:recipe_foods, :foods).where(public: true).order('created_at DESC').map do |recipe|
      {
        id: recipe.id,
        recipe_foods: recipe.recipe_foods.map(&:id),
        foods: recipe.foods,
        name: recipe.name,
        user: recipe.user.name,
        description: recipe.description,
        ingredients_amount: recipe.recipe_foods.count,
        ingredients_price: recipe.foods.map(&:price),
        allQuantities: recipe.recipe_foods.map(&:quantity)
      }
    end
  end
end
