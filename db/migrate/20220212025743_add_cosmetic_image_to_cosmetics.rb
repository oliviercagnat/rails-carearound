class AddCosmeticImageToCosmetics < ActiveRecord::Migration[6.1]
  def change
    add_column :cosmetics, :cosmetic_image, :string
  end
end
