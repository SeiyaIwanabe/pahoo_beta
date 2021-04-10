class CreateIntermediates < ActiveRecord::Migration[5.2]
  def change
    create_table :intermediates do |t|
      t.references :banner, foreign_key: true
      t.references :banner_tag, foreign_key: true

      t.timestamps
    end
  end
end
