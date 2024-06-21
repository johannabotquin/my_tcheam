class AddPointsToTasks < ActiveRecord::Migration[7.1]
  def change
    add_column :tasks, :points, :string
  end
end
