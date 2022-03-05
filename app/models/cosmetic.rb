class Cosmetic < ApplicationRecord
  has_many :reviews
  has_and_belongs_to_many :ingredients
  #validates :name, :description, :brand, :average_price, :category, presence: true
  acts_as_favoritable
  acts_as_taggable_on :tags
  acts_as_taggable_on :ingredients
  has_one_attached :cosmetic_image
  TAGS = [ "Oil Free", "Purpicks", 'Silicone Free', "Water Free" ] + Ingredient.pluck(:name_en)
  INGREDIENTS = Ingredient.pluck(:name_en)
  scope :by_join_date, -> { order("created_at DESC") }
# other-tags ["For sensitive skin", "sulphate-free", "Canadian", "CertClean","Chemical Free", "Dairy Free", "EWG Verified", "EcoCert", "Fair Trade", "Gluten Free", "Hypoallergenic", "Natural", "No Talc", "Non-GMO", "Organic", "Peanut Free Product", "Sugar Free", "USDA Organic", "Vegan", "Alcohol Free", "Cruelty Free",]
  #the above is so we can search by tags
  include PgSearch::Model
  pg_search_scope :search_by_brand_and_description,
    against: [ :brand, :description ],
    using: {
      tsearch: { prefix: true }
    }

  def total_reviews
    total_reviews = self.reviews.count
    return total_reviews
  end

  def average_review
    if total_reviews == 0
      0
    else
    total_rating = self.reviews.sum(:rating)
    total_rating / total_reviews
    end
  end
end
