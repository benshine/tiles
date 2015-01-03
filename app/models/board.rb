require 'color-generator'

class Board < ActiveRecord::Base
  has_many :tiles

  # Delete all the tiles we've got so far, then make new ones
  # based on the colors array passed in
  def update_tiles(tile_colors)
    tiles.each { |tile| tile.destroy }
    create_tiles(tile_colors)
  end

  # Create new tiles using the colors array passed in, or make random colors
  # if there isn't an entry in the array
  def create_tiles(tile_colors = [])
    0.upto(height - 1) do |row|
      0.upto(width - 1) do |column|
        color = tile_colors[index_for(row, column)]  || color_generator.create_hex
        t = Tile.create(:row => row, :column => column, :color => color)
        tiles << t
      end
    end
  end

  def tile_at(row, column)
    tiles[index_for(row, column)]
  end

  def tiles_as_list
    tiles.pluck(:color).join(',')
  end

  def index_for(row, column)
    row * width + column
  end

  def color_generator
    @color_generator = @color_generator || ColorGenerator.new(saturation: 0.3, value: 1.0)
  end
end
