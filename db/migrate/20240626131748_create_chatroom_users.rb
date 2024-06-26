class CreateChatroomUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :chatroom_users do |t|
      t.references :chatroom, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end

    add_index :chatroom_users, [:chatroom_id, :user_id], unique: true
  end
end
