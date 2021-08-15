class CreateLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :likes do |t|
      t.integer :author_id, null: false
      t.integer :dog_id, null: false
      t.timestamps
    end
    add_index :likes, [:dog_id, :author_id], unique: true
  end
end
