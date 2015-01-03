class Tile < ActiveRecord::Base
  belongs_to :board

  # TODO: validate color via regex

  def hex_color
    '#' + color
  end
end
