class AddColumnsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :nickname, :string
    add_column :users, :id_name, :string
    add_column :users, :icon, :string
    add_column :users, :provider, :string
    add_column :users, :uid, :string
    add_column :users, :meta, :string
  end
end
