class AddColumnPublicUidToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :public_uid, :string
  end
end
