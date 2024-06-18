class AddPhotoToTeams < ActiveRecord::Migration[7.1]
  def change
    add_column :teams, :photo, :string
  end
end
