class PublicRecipesController < ApplicationController
  def index
    @recipes = Recipe.includes(:recipe_foods, :foods).where(public: true).order('created_at DESC').map do |recipe|
      {
        id: recipe.id,
        name: recipe.name,
        user: recipe.user.name,
        description: recipe.description,
        ingredients_amount: recipe.recipe_foods.count,
        ingredients_price: recipe.foods.map(&:Price).sum
      }
    end
  end
end
