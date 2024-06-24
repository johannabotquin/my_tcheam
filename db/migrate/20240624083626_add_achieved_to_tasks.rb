class AddAchievedToTasks < ActiveRecord::Migration[7.1]
  def change
    add_column :tasks, :achieved, :boolean, default: false
  end
end
