class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_digest
      t.string :nickname, null: false
      t.string :id_name, null: false

      t.timestamps
    end
    add_index :users, :email, unique: true
  end
end
