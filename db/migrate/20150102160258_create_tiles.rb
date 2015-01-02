class CreateTiles < ActiveRecord::Migration
  def change
    create_table :tiles do |t|
      t.string :color

      t.timestamps null: false
    end
  end
end
