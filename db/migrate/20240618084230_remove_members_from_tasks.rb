class RemoveMembersFromTasks < ActiveRecord::Migration[7.1]
  def change
    remove_column :tasks, :members, :text
  end
end
