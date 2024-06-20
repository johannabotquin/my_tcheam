class AddTeamsToMemories < ActiveRecord::Migration[7.1]
  def change
    add_reference :memories, :team, null: false, foreign_key: true
  end
end
