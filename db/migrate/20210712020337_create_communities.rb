class CreateCommunities < ActiveRecord::Migration[5.2]
  def change
    create_table :communities do |t|
      t.string :community_title, null: false
      t.index :community_title, unique: true
      t.timestamps
    end
  end
end
