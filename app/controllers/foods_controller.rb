class FoodsController < ApplicationController
  def index
    @foods = Food.all
  end

  def show
    @food = Food.find(params[:id])
  end

  def new
    @new_food = Food.new
  end

  def create
    food = Food.new(user: current_user, **post_params)
    if food.save
      redirect_to foods_path notice: 'Food added successfully'
    else
      render :new
    end
  end

  def destroy
    food = Food.find(params[:id])
    if food.destroy
      flash[:notice] = 'Food deleted'
    else
      flash[:alert] = 'Couldn\'t delete food'
    end
    redirect_to foods_path
  end

  def post_params
    params.require(:food).permit(:name, :measurement_unit, :price, :quantity)
  end
end
