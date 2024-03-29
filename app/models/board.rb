require 'color-generator'

class Board < ActiveRecord::Base
  serialize :tile_colors, JSON

  DEFAULT_HEIGHT = 3
  DEFAULT_WIDTH = 4
  WHITE_AS_HEX = 'ffffff'

  after_initialize :create_defaults

  def create_defaults
    self.name ||= Faker::Lorem.word.capitalize
    self.height ||= DEFAULT_HEIGHT
    self.width ||= DEFAULT_WIDTH
    self.tile_colors ||= Array.new(width * height, WHITE_AS_HEX)
  end

  def update_colors_from_params(colors_param)
    required_colors = width * height
    if (colors_param.count < required_colors)
      colors_param.fill(WHITE_AS_HEX, -1, required_colors - colors_param.count + 1)
    end
    self.tile_colors = colors_param
    save
  end

  def color_at(row, column)
    if (columns.include?(column) && (rows.include?(row)))
      tile_colors[index_for(row, column)]
    else
      raise RangeError.new("Row #{row}, column #{column} is outside the #{width} x #{height} bounds of the grid")
    end
  end

  def columns
    0..(width - 1)
  end

  def rows
    0..(height - 1)
  end

  def index_for(row, column)
    row * width + column
  end

  def color_generator
    @color_generator = @color_generator || ColorGenerator.new(saturation: 0.5, value: 1.0)
  end
end
