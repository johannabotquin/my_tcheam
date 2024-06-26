class AddReferenceUserToChatroom < ActiveRecord::Migration[7.1]
  def change
    add_reference :chatrooms, :team, foreign_key: true
  end
end
