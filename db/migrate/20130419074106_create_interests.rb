class CreateInterests < ActiveRecord::Migration
  def change
    create_table :interests do |t|
      t.integer :user_id
      t.integer :topic_id

      t.timestamps
    end

    add_index :interests, :user_id
    add_index :interests, :topic_id
    add_index :interests, [:user_id, :topic_id], unique: true
  end
end
