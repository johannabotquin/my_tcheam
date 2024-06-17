class CreateLists < ActiveRecord::Migration[7.1]
  def change
    create_table :lists do |t|
      t.string :name
      t.text :content
      t.text :members, default: [], array: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
