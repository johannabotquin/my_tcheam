class RemovePointFromTasks < ActiveRecord::Migration[7.1]
  def change
    remove_column :tasks, :points, :string
  end
end
