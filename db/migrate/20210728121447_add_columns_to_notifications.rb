class AddColumnsToNotifications < ActiveRecord::Migration[5.2]
  def change
    add_column :notifications, :community_id, :integer
    add_column :notifications, :community_comment_id, :integer
  end
end
