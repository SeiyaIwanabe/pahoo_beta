class CreateBannerTags < ActiveRecord::Migration[5.2]
  def change
    create_table :banner_tags do |t|
      t.string :banner_tag_name

      t.timestamps
    end
  end
end
