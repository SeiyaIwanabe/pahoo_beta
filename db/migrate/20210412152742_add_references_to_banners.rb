class AddReferencesToBanners < ActiveRecord::Migration[5.2]
  def change
    add_reference :banners, :user, null: false, foreign_key: true
  end
end
