class AddPointToTasks < ActiveRecord::Migration[7.1]
  def change
    add_column :tasks, :points, :integer
  end
end
