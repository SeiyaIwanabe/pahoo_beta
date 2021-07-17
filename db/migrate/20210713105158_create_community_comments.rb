class CreateCommunityComments < ActiveRecord::Migration[5.2]
  def change
    create_table :community_comments do |t|
      t.references :community, foreign_key: true
      t.references :user, foreign_key: true
      t.string :community_comment, null: false

      t.timestamps
    end
  end
end
