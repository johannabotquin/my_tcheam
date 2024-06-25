class AddTeamToTasks < ActiveRecord::Migration[7.1]
  def change
    add_reference :tasks, :team, foreign_key: true
  end
end
