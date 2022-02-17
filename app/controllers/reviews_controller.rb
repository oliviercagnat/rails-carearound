class ReviewsController < ApplicationController

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @cosmetic = Cosmetic.find(:id)
    @review.cosmetic = @cosmetic
    if @cosmetic.save
      redirect_to cosmetic_path(@cosmetic)
    else
      render 'cosmetic/show'
    end
  end

  private

  def reviews_params
    params_require(:review).permit(:content, :rating, :shop_url, :user_id, :cosmetic_id)
  end
end

#needs to have a forg prod key (refrence to product)
