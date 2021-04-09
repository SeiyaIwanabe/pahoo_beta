class CreateConnects < ActiveRecord::Migration[5.2]
  def change
    create_table :connects do |t|
      t.references :post, foreign_key: true
      t.references :post_tag, foreign_key: true

      t.timestamps
    end
  end
end
