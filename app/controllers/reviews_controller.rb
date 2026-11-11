class ReviewsController < ApplicationController
  # restaurants/14/reviews/new
  def new
    # this is just for the form
    @review = Review.new
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  # WE NEED A FORM to post -> restaurants/14/reviews
  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new(review_params)
    @review.restaurant = @restaurant
    if @review.save
      redirect_to restaurant_path(@restaurant)
    else
      render 'new', status: :unprocessable_entity
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to restaurant_path(@review.restaurant), status: :see_other
  end

  private

  def review_params
    params.require(:review).permit(:content)
  end
end
