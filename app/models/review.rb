class Review < ApplicationRecord
  belongs_to :cosmetic
  belongs_to :user
  validates :content, :rating, :shop_url, presence: true
  # look into active record validation page to set rating from 1..5 (not super important)
  # belongs_to :cosmetic
end
