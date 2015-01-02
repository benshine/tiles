class CreateBoards < ActiveRecord::Migration
  def change
    create_table :boards do |t|
      t.string :name
      t.integer :width
      t.integer :height
      t.date :created_at

      t.timestamps null: false
    end
  end
end
