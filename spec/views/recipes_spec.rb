require 'rails_helper'

RSpec.describe 'Testing recipes view', type: :feature do
  describe 'Recipes#index' do
    before(:each) do
      user = User.create name: 'Tom', email: 'tom@example.com', password: 'password'
      (1..5).each do |i|
        user.recipes.create name: "Recipe number #{i}", preparation_time: 60, cooking_time: 90, description: 'Steps goes here',
                            public: true
      end

      visit new_user_session_path
      fill_in 'Email', with: 'tom@example.com'
      fill_in 'Password', with: 'password'
      click_button 'Log in'
      visit recipes_path
    end

    it 'should see all of the recipes' do
      expect(page).to have_content 'Recipe number 1'
      expect(page).to have_content 'Recipe number 2'
      expect(page).to have_content 'Recipe number 3'
      expect(page).to have_content 'Recipe number 4'
      expect(page).to have_content 'Recipe number 5'
    end

    it 'should be able to see delete button for each recipe' do
      within('body') do
        expect(find_all('button').length).to eq 5
      end
    end

    it 'should lead to recipe details page' do
      click_on 'Recipe number 1'
      expect(current_path).to eq recipe_path(Recipe.where(name: 'Recipe number 1').first.id)
      expect(current_path).to_not eq recipe_path(Recipe.where(name: 'Recipe number 2').first.id)
    end
  end
end
