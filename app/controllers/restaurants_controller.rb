class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: %i[ show edit update destroy]

  # get /restaurants
  def index
    @restaurants = Restaurant.all
  end

  # get /restaurants/:id
  def show
  end

  def new
    @restaurant = Restaurant.new
  end

  def edit
  end

  # post /restaurants
  def create
    @restaurant = Restaurant.new(restaurant_params)

    if @restaurant.save
      redirect_to @restaurant, notice: "Restaurant was successfully created"
    else
    render :new, status: :unprocessable_entity
    end
  end

  # patch /restaurants/:id
  def update
    if @restaurant.update(restaurant_params)
      redirect_to @restaurant, notice: "Restaurant was successfully udpated"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # delete /restaurants/:id
  def destroy
    @restaurant.destroy
    redirect_to restaurant_url, notice: "Restaurant was successfully deleted"
  end

private

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :phone_number, :category)
  end
end
