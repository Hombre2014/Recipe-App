class FoodsController < ApplicationController
  load_and_authorize_resource

  def index
    @foods = current_user.foods
    @food = Food.find_by(id: params[:id])
    # @foods = Food.all
  end

  def show; end

  def new
    @foods = current_user.foods.includes(:recipes)
    # @food = Food.new
  end

  def create
    @food = current_user.foods.new(food_params)

    respond_to do |format|
      if @food.save
        format.html { redirect_to food_url(@food), notice: 'The ingredients have been added successfully.' }
        format.json { render :show, status: :created, location: @food }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @food.errors, status: :unprocessable_entity }
      end
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
