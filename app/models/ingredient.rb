class Ingredient < ApplicationRecord
  validates :name_en, :name_jp, presence: true
  has_and_belongs_to_many :cosmetics
end
