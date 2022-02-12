class Cosmetic < ApplicationRecord
  has_many :reviews
  #has_many :ingredients
  acts_as_favoritable
end
