class CosmeticsController < ApplicationController

  before_action :set_cosmectic, only: %i[show]

  # The user must be logged in to like a cosmetic.
  # The toggle_favorite action is called if the user is logged in,
  # using the Devise helper.
  before_action :authenticate_user!, only: :toggle_favorite

  def index
    # The first 5 is temporary
    @cosmetics = policy_scope(Cosmetic).first(5)
    @favorite_cosmetics = current_user.favorited_by_type('Cosmetic')
  end

  def show
    @cosmetic = Cosmetic.find(params[:id])
    cosmetic_policy_authorize
  end

  def update
    @cosmetic = Cosmetic.find(params[:id])
    @cosmetic.update(cosmetic_params)
    redirect_to root_path
  end

  private

  def cosmetic_policy_authorize
    authorize @cosmetic
  end

  def set_cosmectic
    @cosmetic = Cosmetic.find(params[:id])
  end

  def cosmetic_params
    params.require(:cosmetic).permit(:cosmetic_image, :name, :description, :brand, :average_price, :category, :ingredient_id, :tag_list)
  end

  def toggle_favorite
    # The toggle_favorite action finds the cosmetic to like through the id parameter.
    @cosmetic = Cosmetic.find_by(id: params[:id])
    # It checks if a user has liked it. If it’s been favourited before, it is now unfavorited and vice versa.
    current_user.favorited?(@cosmetic) ? current_user.unfavorite(@cosmetic) : current_user.favorite(@cosmetic)
  end
end
