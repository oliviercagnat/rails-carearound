class AddNameEnToIngredients < ActiveRecord::Migration[6.1]
  def change
    add_column :ingredients, :name_en, :string
  end
end
