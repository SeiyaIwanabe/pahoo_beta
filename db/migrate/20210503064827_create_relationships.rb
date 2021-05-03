class CreateRelationships < ActiveRecord::Migration[5.2]
  def change
    create_table :relationships do |t|
      t.integer :sender_id
      t.integer :recipient_id
      t.index [:sender_id, :recipient_id], unique: true

      t.timestamps
    end
  end
end
