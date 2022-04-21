class FoodsController < ApplicationController
  load_and_authorize_resource
  before_action :set_food, only: %i[show edit update destroy]

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

  # GET /foods/1/edit
  def edit; end

  def create
    @food = current_user.foods.new(food_params)

    respond_to do |format|
      if @food.save
        format.html { redirect_to foods_path, notice: 'The ingredients have been added successfully.' }
        format.json { render :show, status: :created, location: @food }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @food.errors, status: :unprocessable_entity }
      end
    end
  end

  # def create
  #   @food = @foods.new(food_params)

  #   if @food.save
  #     flash[:notice] = 'The ingredients have been added successfully'
  #     redirect_to foods_path
  #   else
  #     flash[:alert] = 'Adding a new ingredient failed'
  #     render :new, status: :unprocessable_entity
  #   end
  # end

  def destroy
    # @food = Food.find_by(id: params[:id])
    # @food.destroy!

    # redirect_to foods_path, notice: 'The ingredient have been deleted successfully'

    @food = Food.find_by(id: params[:id])
    @food.destroy

    respond_to do |format|
      format.html { redirect_to foods_url, notice: 'The ingredient have been deleted successfully.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_food
    @food = Food.find(params[:id])
  end

  def food_params
    params.require(:food).permit(:user_id, :name, :measurement_unit, :price)
  end
end
