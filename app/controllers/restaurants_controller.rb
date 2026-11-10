class RestaurantsController < ApplicationController
  # '/restaurants'
  def index
    # load restaurants from the db and pass to the view
    @restaurants = Restaurant.all
    # render index.html.erb
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    # render show.html.erb
  end

  def new
    # this is just for the form
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      # go to the show page
      redirect_to restaurant_path(@restaurant)
    else
      # show the form with the errror messages
      # render -> stay in this action and show that view
      render "new", status: :unprocessable_entity
    end
  end

  # /restaurants/3/edit
  def edit
    # this is just for the form
    @restaurant =  Restaurant.find(params[:id])
  end

  # WE CANT ACCESS THIS VIA A URL -> SUBMIT A FORM
  # patch /restaurants/3
  def update
    @restaurant = Restaurant.find(params[:id])
    if @restaurant.update(restaurant_params)
      # go to the show page
      redirect_to restaurant_path(@restaurant)
    else
      #  show the form with the errror messages
      # render -> stay in this action and show that view
      render "edit", status: :unprocessable_entity
    end
  end

  def destroy
    @restaurant = Restaurant.find(params[:id])
    @restaurant.destroy
    # No need for app/views/restaurants/destroy.html.erb
    redirect_to restaurants_path, status: :see_other
  end

  private

  def restaurant_params
    # FORM DATA
    # STRONG PARAMS -> whitelist the attributes the user can give
    # filtering the data the user sends from the form
    params.require(:restaurant).permit(:name, :rating, :address)
  end
end
