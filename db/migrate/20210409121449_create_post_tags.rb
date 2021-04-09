class CreatePostTags < ActiveRecord::Migration[5.2]
  def change
    create_table :post_tags do |t|
      t.string :post_tag_name, null: false

      t.timestamps
    end
  end
end
