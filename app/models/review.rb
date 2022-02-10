class Review < ApplicationRecord
  belongs_to :user
  belongs_to :cosmetic
end
