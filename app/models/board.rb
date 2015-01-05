require 'color-generator'

class Board < ActiveRecord::Base
  has_many :tiles, dependent: :destroy

  serialize :tile_colors, JSON

  DEFAULT_HEIGHT = 3
  DEFAULT_WIDTH = 4
  
  def create_defaults
    self.name = Faker::Lorem.word.capitalize
    self.height = DEFAULT_HEIGHT
    self.width = DEFAULT_WIDTH
    create_colors
  end

  def create_colors
    self.tile_colors = Array.new(width * height) { |i| color_generator.create_hex }
  end

  def update_colors_from_params(colors_param)
    self.tile_colors = colors_param
    self.save
  end

  def columns
    0..(width - 1)
  end

  def rows
    0..(height - 1)
  end

  def color_at(row, column)
    puts("tile_colors: ", tile_colors)
    if (columns.include?(column) && (rows.include?(row)))
      '#' + tile_colors[index_for(row, column)]
    else
      '#FF0000'
    end
  end

  def tiles_as_list
    tile_colors.join(',')
  end

  def index_for(row, column)
    row * width + column
  end

  def color_generator
    @color_generator = @color_generator || ColorGenerator.new(saturation: 0.3, value: 1.0)
  end
end
