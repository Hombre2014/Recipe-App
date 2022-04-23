require 'rails_helper'

RSpec.describe 'Recipes', type: :request do
  describe 'GET recipes#index' do
    before(:each) do
      user = User.create name: 'Tom', email: 'tom@example.com', password: 'password'
      post user_session_path, params: { user: { email: user.email, password: user.password } }
      get recipes_path
    end

    it 'should return http success' do
      expect(response).to have_http_status(:success)
    end

    it 'should render correct template' do
      expect(response).to render_template(:index)
    end

    it 'should render correct content' do
      expect(response.body).to include('Welcome, Tom')
    end
  end

  describe 'GET /show' do
    before(:each) do
      user = User.create name: 'Tom', email: 'tom@example.com', password: 'password'
      recipe = Recipe.create name: 'Pudding', cooking_time: 60, preparation_time: 20,
                             description: 'Steps goes here', public: true, user: user
      post user_session_path, params: { user: { email: user.email, password: user.password } }
      get recipe_path(recipe.id)
    end

    it 'should return http success' do
      expect(response).to have_http_status(:success)
    end

    it 'should render correct template' do
      expect(response).to render_template(:show)
    end

    it 'should render correct content' do
      expect(response.body).to include('Pudding')
      expect(response.body).to include('Cooking time: 60')
      expect(response.body).to include('Steps goes here')
    end
  end
end
