class FoodsController < ApplicationController
  def index
    @foods = Food.all
  end

  def new
    @food = Food.new
  end

  def create
    @food = foods.new(food_params)

    if @food.save
      flash[:notice] = 'The ingredients have been added successfully'
      redirect_to foods_path
    else
      flash[:alert] = 'Adding a new ingredient failed'
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @food = Food.find(params[:id])
    @food.destroy!
    redirect_to foods_path, notice: 'The ingredient have been deleted successfully'
  end

  private

  def food_params
    params.require(:food).permit(:user_id, :name, :measurement_unit, :price)
  end
end
