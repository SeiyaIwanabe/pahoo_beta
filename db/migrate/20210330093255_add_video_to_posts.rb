class AddVideoToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :post_video, :string
  end
end
