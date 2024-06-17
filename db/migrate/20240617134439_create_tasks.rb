class CreateTasks < ActiveRecord::Migration[7.1]
  def change
    create_table :tasks do |t|
      t.string :name
      t.text :description
      t.string :category
      t.boolean :reccurence
      t.integer :points
      t.date :deadline
      t.boolean :achieved
      t.text :members, default: [], array: true
      t.integer :priority_tag
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
