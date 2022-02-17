class AddCountryOfOriginToCosmetics < ActiveRecord::Migration[6.1]
  def change
    add_column :cosmetics, :country_of_origin, :string
  end
end
