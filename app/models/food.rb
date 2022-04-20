class Food < ApplicationRecord
  belongs_to :user
  has_many :recipes, through: :recipe_foods

  validates :name, length: { in: 1..250 }, presence: true, allow_blank: false
  validates :measurementUnit, length: { in: 1..250 }, presence: true, allow_blank: false
  validates :price, presence: true, allow_blank: false
end