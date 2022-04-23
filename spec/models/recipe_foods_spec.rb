require 'rails_helper'

RSpec.describe 'RecipeFoods', type: :model do
  describe 'recipe_foods model' do
    user = User.create(name: 'Tom', email: 'tom@example.com', password: '123456')
    subject { Food.new(user_id: user, name: 'Sugar', measurement_unit: 'Kilograms', price: 6) }
    before { subject.save }

    it 'should check that the name is not blank' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'should check that the measurement_unit is not blank' do
      subject.measurement_unit = nil
      expect(subject).to_not be_valid
    end

    it 'should check that the price is not blank' do
      subject.price = nil
      expect(subject).to_not be_valid
    end
  end
end
