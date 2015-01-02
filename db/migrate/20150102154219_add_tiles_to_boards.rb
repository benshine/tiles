class AddTilesToBoards < ActiveRecord::Migration
  def change
    add_column :boards, :tiles, :text
  end
end
