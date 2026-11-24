class RestaurantsController < ApplicationController
  # You don't have to be logged in for these actions:
  skip_before_action :authenticate_user!, only: [ :index, :show ]

  def top
    @restaurants = Restaurant.where(rating: 5)
    render "index"
    # render top.html.erb
  end

  # /restaurants/1/navigate
  def navigate
    @restaurant = Restaurant.find(params[:id])
  end

  # '/restaurants'

  def index
    # load restaurants from the db and pass to the view
    # @restaurants = Restaurant.all
    # @restaurants = current_user.restaurants
    @restaurants = policy_scope(Restaurant) # specify which restaurants we want in the policy
    # render index.html.erb
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    # Check the policy and see if the user can #show?
    authorize @restaurant
  end

  def new
    # this is just for the form
    @restaurant = Restaurant.new
    authorize @restaurant
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    @restaurant.user = current_user
    authorize @restaurant
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
    authorize @restaurant # this restaurant is our "record"
  end

  # WE CANT ACCESS THIS VIA A URL -> SUBMIT A FORM
  # patch /restaurants/3
  def update
    @restaurant = Restaurant.find(params[:id])
    authorize @restaurant
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
    authorize @restaurant
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
