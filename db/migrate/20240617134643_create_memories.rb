class CreateMemories < ActiveRecord::Migration[7.1]
  def change
    create_table :memories do |t|
      t.string :name
      t.text :content
      t.date :date
      t.references :reward, null: false, foreign_key: true

      t.timestamps
    end
  end
end
