class AddSelectedToRewards < ActiveRecord::Migration[7.1]
  def change
    add_column :rewards, :selected, :boolean
  end
end
