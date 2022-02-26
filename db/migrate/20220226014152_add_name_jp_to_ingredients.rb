class AddNameJpToIngredients < ActiveRecord::Migration[6.1]
  def change
    add_column :ingredients, :name_jp, :string
  end
end
