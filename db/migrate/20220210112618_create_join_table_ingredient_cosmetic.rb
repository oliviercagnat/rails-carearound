class CreateJoinTableIngredientCosmetic < ActiveRecord::Migration[6.1]
  def change
    create_join_table :ingredients, :cosmetics do |t|
      # t.index [:ingredient_id, :cosmetic_id]
      # t.index [:cosmetic_id, :ingredient_id]
    end
  end
end
