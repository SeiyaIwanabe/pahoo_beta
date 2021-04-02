class AddBannerTagToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :banner_tag, :string, null: false
  end
end
