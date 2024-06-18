class RemoveMembersFromLists < ActiveRecord::Migration[7.1]
  def change
    remove_column :lists, :members, :text
  end
end
