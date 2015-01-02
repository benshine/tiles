class RemoveTilesFromBoards < ActiveRecord::Migration
  def change
    change_table :boards do |t|
      t.remove :tiles
    end
  end
end
