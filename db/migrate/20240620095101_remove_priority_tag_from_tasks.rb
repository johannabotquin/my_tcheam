class RemovePriorityTagFromTasks < ActiveRecord::Migration[7.1]
  def change
    remove_column :tasks, :priority_tag, :integer
  end
end
