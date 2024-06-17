class CreateTaskManagers < ActiveRecord::Migration[7.1]
  def change
    create_table :task_managers do |t|
      t.references :task, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
