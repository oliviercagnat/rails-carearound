class Ingredient < ApplicationRecord
  validates :name, :description, :pros, :cons, presence: true
end
