class CosmeticsController < ApplicationController


def show
  @cosmetic = Cosmetic.find(params[:id])
end

def update
  @cosmetic = Cosmetic.find(params[:id])
  @cosmetic.update(cosmetic_params)
  redirect_to root_path
end

  private

  def cosmetic_params
    params.require(:cosmetic).permit(:name, :tag_list) ## Rails 4 strong params usage
  end
end
