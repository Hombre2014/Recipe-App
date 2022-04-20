class CreateFoods < ActiveRecord::Migration[7.0]
  def change
    create_table :foods do |t|
      t.string :name
      t.string :measurementUnit
      t.decimal :Price

      t.timestamps
    end
  end
end