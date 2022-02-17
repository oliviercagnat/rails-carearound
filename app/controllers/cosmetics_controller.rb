

class CosmeticsController < ApplicationController
  before_action :set_cosmectic, only: %i[show]

  # The user must be logged in to like a cosmetic.
  # The toggle_favorite action is called if the user is logged in,
  # using the Devise helper.
  before_action :authenticate_user!, only: :toggle_favorite

  def index
    # When we display all, we get some cosmetics with no brand, description, etc.
    # Display less so we don't get too much errors
    # Later will implement search button anyway and will get only the ones we look for.

    @cosmetics = policy_scope(Cosmetic).first(50)

    @favorite_cosmetics = current_user.favorited_by_type('Cosmetic')

  end

  def show
    cosmetic_policy_authorize
  end

  def update
    @cosmetic = Cosmetic.find(params[:id])
    #@cosmetic.update(cosmetic_params)
    @cosmetic.tag_list.add(cosmetic_params[:tag_list])
    @cosmetic.save
    cosmetic_policy_authorize
    redirect_to root_path
  end

  def toggle_favorite
    # The toggle_favorite action finds the cosmetic to like through the id parameter.
    @cosmetic = Cosmetic.find_by(id: params[:id])
    cosmetic_policy_authorize
    # It checks if a user has liked it. If it’s been favourited before, it is now unfavorited and vice versa.
    current_user.favorited?(@cosmetic) ? current_user.unfavorite(@cosmetic) : current_user.favorite(@cosmetic)
  end

  private

  def cosmetic_policy_authorize
    authorize @cosmetic
  end

  def set_cosmectic
    @cosmetic = Cosmetic.find(params[:id])
  end

  def cosmetic_params
    params.require(:cosmetic).permit(:cosmetic_image, :name, :description, :brand, :average_price, :category, :ingredient_id, tag_list: [])
  end


end
