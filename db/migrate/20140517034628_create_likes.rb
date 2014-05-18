class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.string  :likable_type, null: false
      t.integer :likable_id, null: false
      t.integer :user_id, null: false
      t.boolean :deleted, null: false, default: false

      t.timestamps
    end

    add_index :likes, [:likable_type, :user_id]
  end
end
