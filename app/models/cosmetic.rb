class Cosmetic < ApplicationRecord
  has_many :reviews
  #has_many :ingredients
  validates :name, :description, :brand, :average_price, :category, presence: true
  acts_as_favoritable
  acts_as_taggable_on :tags
  acts_as_taggable_on :cosmetics
end
