class RemoveBannerTagFromBanners < ActiveRecord::Migration[5.2]
  def change
    remove_column :banners, :banner_tag, :string
  end
end
