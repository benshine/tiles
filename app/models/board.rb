require 'color-generator'

class Board < ActiveRecord::Base
  has_many :tiles

  after_create :create_tiles

  def color_generator
    @color_generator = @color_generator || ColorGenerator.new(saturation: 0.3, value: 1.0)
  end

  def create_tiles
    0.upto(height - 1) do |row|
      0.upto(width - 1) do |column|
        t = Tile.create(:row => row, :column => column, :color => color_generator.create_hex )
        tiles << t
      end
    end
  end

  def tile_at(row, column)
    tiles[row * width + column]
  end
end
