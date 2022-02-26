class RemoveNameFromIngredients < ActiveRecord::Migration[6.1]
  def change
    remove_column :ingredients, :name, :string
  end
end
