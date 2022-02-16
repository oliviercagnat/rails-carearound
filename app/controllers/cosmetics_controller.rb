class CosmeticsController < ApplicationController
  before_action :set_cosmetic, only: %i[show]
  before_action :skip_authorization, only: :search

  def index
    @cosmetics = policy_scope(Cosmetic).first(5)
  end

  def show
    authorize @cosmetic
    @cosmetic = Cosmetic.find(params[:id])
  end

  def update
    @cosmetic = Cosmetic.find(params[:id])
    @cosmetic.update(cosmetic_params)
    redirect_to root_path
  end

  def search
    @photo = params[:photo]
  end

  private

  def cosmetic_policy_authorize
    authorize @cosmetic
  end

  def set_cosmetic
    @cosmetic = Cosmetic.find(params[:id])
  end

  def cosmetic_params
    params.require(:cosmetic).permit(:cosmetic_image, :name, :description, :brand, :average_price, :category, :ingredient_id, :tag_list)
  end

end
