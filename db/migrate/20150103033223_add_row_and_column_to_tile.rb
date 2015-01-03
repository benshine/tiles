class AddRowAndColumnToTile < ActiveRecord::Migration
  def change
    add_column :tiles, :row, :integer
    add_column :tiles, :column, :integer
  end
end
