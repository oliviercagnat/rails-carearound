class CreateCosmetics < ActiveRecord::Migration[6.1]
  def change
    create_table :cosmetics do |t|
      t.string :name
      t.string :description
      t.string :brand
      t.integer :average_price
      t.string :category

      t.timestamps
    end
  end
end
