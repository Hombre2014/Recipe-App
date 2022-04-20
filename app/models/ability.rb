class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    if user.is? :admin
      can :manage, :all
    else
      can :manage, Recipe, user_id: user.id
      can :manage, Food, user_id: user.id
      can :manage, Recipe do |recipe|
        recipe.user == user || recipe.public == true || !recipe.user_id?
      end
    end
  end
end
