class Ingredient < ApplicationRecord
  validates :name_en, :name_jp, presence: true
  has_and_belongs_to_many :cosmetics
  acts_as_taggable_on :tags
  acts_as_taggable_on :ingredients
end
