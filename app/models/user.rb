class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :foods, dependent: :destroy
  has_many :recipes, dependent: :destroy

  validates :name, presence: true, length: { minimum: 1, maximum: 50 }

  def sum(array)
    sum = 0
    array.each do |number|
      sum += number.quantity * number.food.Price
    end
    sum
  end

  ROLES = %i[admin default].freeze

  def is?(requested_role)
    role == requested_role.to_s
  end
end
