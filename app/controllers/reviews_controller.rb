class ReviewsController < ApplicationController

  def new
    @review = Review.new
  end

  def create
    binding.pry
    @review = Review.new(review_params)
    @cosmetic = Cosmetic.find(:cosmetic_id)
    @review.cosmetic = @cosmetic
    if @cosmetic.save
      redirect_to new_cosmetic_review_path(@cosmetic)
      respond_to do |format|
        format.html { redirect_to cosmetics_path(@cosmetic) }
        format.js # render create.js.erb (default Rails behaviour at the end of an action)
        format.json # render create.json view
      end
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
