class RemoveBanerTagFromPosts < ActiveRecord::Migration[5.2]
  def change
    remove_column :posts, :banner_tag, :string
  end
end
