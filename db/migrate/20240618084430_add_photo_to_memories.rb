class AddPhotoToMemories < ActiveRecord::Migration[7.1]
  def change
    add_column :memories, :photo, :string
  end
end
