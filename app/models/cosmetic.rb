class Cosmetic < ApplicationRecord
  has_many :reviews
  #has_many :ingredients
  acts_as_favoritable
  acts_as_taggable_on :tags
  acts_as_taggable_on :cosmetics
end
