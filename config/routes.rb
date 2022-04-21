Rails.application.routes.draw do
  devise_for :users

  root "public_recipes#index"

  resources :foods, only: [:index, :show, :new, :create, :destroy]
  resources :recipes, only: [:index, :show, :new, :create, :destroy] do
    resources :recipe_foods, only: [:new, :create, :destroy, :update, :edit] 
    resources :shopping_lists, only: [:index, :show]    
  end
  resources :public_recipes, only: [:index]
  
  devise_scope :user do 
    get '/users/sign_out' => 'devise/sessions#destroy' 
  end

end