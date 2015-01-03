class Tile < ActiveRecord::Base
  belongs_to :board

  def hex_color
    '#' + color
  end
end
