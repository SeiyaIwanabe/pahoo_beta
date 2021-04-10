class AddReferencesToBanner < ActiveRecord::Migration[5.2]
  def change
    add_reference :banners, :banner_tag, foreign_key: true
  end
end
