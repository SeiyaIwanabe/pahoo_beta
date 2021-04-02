class AddBannerTagToBanners < ActiveRecord::Migration[5.2]
  def change
    add_column :banners, :banner_tag, :string
  end
end
