class AddBoardIndexToTiles < ActiveRecord::Migration
  def change
    add_index :tiles, :board_id
  end
end
