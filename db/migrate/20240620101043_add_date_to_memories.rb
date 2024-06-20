class AddDateToMemories < ActiveRecord::Migration[7.1]
  def change
    add_column :memories, :date, :string
  end
end
