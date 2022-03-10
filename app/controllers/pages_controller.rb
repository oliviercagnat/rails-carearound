class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]
  before_action :authenticate_user!, only: [:user_profile]

  def home
    # @cosmetics = Cosmetic.first(5)
    @jp_cosmetics = Cosmetic.includes(:ingredients).where.not(ingredients: {id: nil}).first(5)
  end

  def user_profile
    @favorite_cosmetics = current_user.favorited_by_type('Cosmetic')
  end
end
