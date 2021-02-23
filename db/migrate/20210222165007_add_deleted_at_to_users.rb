class AddDeletedAtToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :deleted_at, :datetime
    remove_index :users, :email
    add_index :users, [:email, :deleted_at], unique: true
  end
end
