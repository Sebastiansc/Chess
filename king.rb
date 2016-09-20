require_relative "piece"
require_relative "stepable"

class King < Piece
  include Stepable

  def symbol
    @color == :white ? " ♔ " : " ♚ "
  end
  STEPS = [
      [0, 1],
      [0, -1],
      [1, 0],
      [-1, 0],
      [1, 1],
      [1, -1],
      [-1, 1],
      [-1, -1]
    ]

  def move_dirs
    moves = move_directions(STEPS)
  end

end
