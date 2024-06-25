class RemoveAchievedFromTasks < ActiveRecord::Migration[7.1]
  def change
    remove_column :tasks, :achieved, :boolean
  end
end
