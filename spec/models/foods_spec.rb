require 'rails_helper'

RSpec.describe Food, type: :model do
  describe 'Food model' do
    @user = User.create(name: 'Tom', email: 'tom@example.com', password: '123456')
    subject { Food.new(user_id: @user, name: 'Flour', measurement_unit: 'Kilograms', price: 4) }
    before { subject.save }

    it 'should check if the name is not blank' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'should check if the measurement_unit is not blank' do
      subject.measurement_unit = nil
      expect(subject).to_not be_valid
    end

    it 'should checks if the price is not empty' do
      subject.price = nil
      expect(subject).to_not be_valid
    end
  end
end
