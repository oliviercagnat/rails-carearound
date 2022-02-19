class ReviewsController < ApplicationController

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    authorize @review
    @cosmetic = Cosmetic.find(params[:cosmetic_id])
    @review.cosmetic = @cosmetic
    @review.user = current_user
    if @review.save
      respond_to do |format|
        format.html { redirect_to cosmetics_path(@cosmetic) }
        format.js # render create.js.erb (default Rails behaviour at the end of an action)
        format.json # render create.json view
      end
    else
      render 'cosmetics/show'
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating, :shop_url, :user_id, :cosmetic_id)
  end
end

#needs to have a forg prod key (refrence to product)
