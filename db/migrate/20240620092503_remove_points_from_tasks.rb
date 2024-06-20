class RemovePointsFromTasks < ActiveRecord::Migration[7.1]
  def change
    remove_column :tasks, :points, :integer
  end
end
