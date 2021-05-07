class AddBannerDetailsToBanners < ActiveRecord::Migration[5.2]
  def change
    add_column :banners, :banner_details, :text, null: false
  end
end
