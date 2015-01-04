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
    create_or_update_colors
  end

  def create_or_update_colors(colors_param = [])
    new_colors = []
    puts "hi?"
    0.upto(height - 1) do |row|
      puts "row #{row.to_s}"
      0.upto(width - 1) do |column|
        puts "um hi" + row.to_s + ", " + column.to_s
        color = colors_param[index_for(row, column)]  || color_generator.create_hex
        new_colors << color
      end
    end
    self.tile_colors = new_colors
    save
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
    tile_colors
  end

  def index_for(row, column)
    row * width + column
  end

  def color_generator
    @color_generator = @color_generator || ColorGenerator.new(saturation: 0.3, value: 1.0)
  end
end
