class AddTileColorsToBoards < ActiveRecord::Migration
  def change
    add_column :boards, :tile_colors, :text
  end
end
