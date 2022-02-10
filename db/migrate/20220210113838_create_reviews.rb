class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.string :content
      t.integer :rating
      t.string :shop_url
      t.references :user, null: false, foreign_key: true
      t.references :cosmetic, null: false, foreign_key: true

      t.timestamps
    end
  end
end
