class AddSkinTypeToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :skin_type, :string
  end
end
