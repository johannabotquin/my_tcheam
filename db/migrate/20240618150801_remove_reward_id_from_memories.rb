class RemoveRewardIdFromMemories < ActiveRecord::Migration[7.1]
  def change
    remove_column :memories, :reward_id, :integer
  end
end
