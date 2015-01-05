class DropTilesTable < ActiveRecord::Migration
  def change
    drop_table :tiles
  end
end
