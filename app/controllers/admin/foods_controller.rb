class Admin::FoodsController < ApplicationController

  def new
    @food = Food.new
  end

  def create
    @food = Food.new(food_params)
    @genre = @food.genre_id
    @food.save
    flash[:notice] = "商品を登録しました"
    redirect_to admin_food_path(@food)
  end

  def index
    @foods = Food.all
  end

  def show
     @food = Food.find(params[:id])
  end

  def edit
    @food = Food.find(params[:id])
  end

  def update
    @food = Food.find(params[:id])
    @food.update(food_params)
    redirect_to admin_food_path(@food)
  end

  private

  def food_params
    params.require(:food).permit(:name, :introduction, :price, :is_active, :genre_id, :food_image)
  end
end
