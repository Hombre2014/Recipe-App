require 'rails_helper'

RSpec.describe 'Foods', type: :request do
  describe 'GET foods#index' do
    before(:each) do
      user = User.create name: 'Tom', email: 'tom@example.com', password: '123456'
      post user_session_path, params: { user: { email: user.email, password: user.password } }
      get foods_path
    end

    it 'should return http success' do
      expect(response).to have_http_status(:success)
    end

    it 'should render correct template' do
      expect(response).to render_template(:index)
    end

    it "should render page contenting 'Ingredients'" do
      expect(response.body).to include('Ingredients')
    end

    it 'should create ingredient with correct attributes' do
      post foods_path, params: { food: { name: 'Beans', price: '4', measurement_unit: 'Kilograms' } }
      expect(Food.last.name).to eq('Beans')
      expect(Food.last.price).to eq(4)
      expect(Food.last.measurement_unit).to eq('Kilograms')
    end

    it 'should create a new ingredient and returns to ingredients page' do
      post foods_path, params: { food: { name: 'Beans', price: '4', measurement_unit: 'Kilograms' } }
      expect(response).to redirect_to(foods_path)
    end
  end
end
