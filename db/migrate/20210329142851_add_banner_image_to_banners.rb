class AddBannerImageToBanners < ActiveRecord::Migration[5.2]
  def change
    add_column :banners, :banner_image, :string
  end
end
