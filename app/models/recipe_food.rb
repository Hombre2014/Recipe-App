class RecipeFood < ApplicationRecord
    validates :quantity, presence: true
    validates :food_id, presence: true
    validates :recipe_id, presence: true
  
    belongs_to :recipe
    belongs_to :food
  end