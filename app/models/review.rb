class Review < ApplicationRecord
  belongs_to :user
  validates :content, :raiting, :shop_url, presence: true
  # belongs_to :cosmetic
end
