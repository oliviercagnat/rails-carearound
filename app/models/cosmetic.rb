class Cosmetic < ApplicationRecord
  has_many :reviews
  #has_many :ingredients
  validates :name, :description, :brand, :average_price, :category, presence: true
  acts_as_favoritable
  acts_as_taggable_on :tags
  acts_as_taggable_on :cosmetics
  TAGS = ["For sensitive skin", "sulphate-free", "Canadian", "CertClean","Chemical Free", "Dairy Free", "EWG Verified", "EcoCert", "Fair Trade", "Gluten Free", "Hypoallergenic", "Natural", "No Talc", "Non-GMO", "Organic", "Peanut Free Product", "Sugar Free", "USDA Organic", "Vegan", "Alcohol Free", "Cruelty Free", "Oil Free", "Purpicks", 'Silicone Free', "Water Free"]

  include PgSearch::Model
  pg_search_scope :search_by_brand_and_name,
    against: [ :brand, :name ],
    using: {
      tsearch: { prefix: true }
    }
end
