class AddCommunityIconToCommunities < ActiveRecord::Migration[5.2]
  def change
    add_column :communities, :community_icon, :string
    add_reference :communities, :user, foreign_key: true
  end
end
