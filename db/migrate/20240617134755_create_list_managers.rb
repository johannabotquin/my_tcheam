class CreateListManagers < ActiveRecord::Migration[7.1]
  def change
    create_table :list_managers do |t|
      t.references :user, null: false, foreign_key: true
      t.references :list, null: false, foreign_key: true

      t.timestamps
    end
  end
end
