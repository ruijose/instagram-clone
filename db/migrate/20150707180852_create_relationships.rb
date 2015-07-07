class CreateRelationships < ActiveRecord::Migration
  def change
    create_table :relationships do |t|
      t.integer :like_receiver_id
      t.integer :like_giver_id

      t.timestamps null: false
    end
  end
end
