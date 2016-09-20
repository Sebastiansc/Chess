require_relative "piece"
require_relative "slidable"

class Bishop < Piece
  include Slidable

  def symbol
    @color == :white ? " ♗ " : " ♝ "
  end

  def move_dirs
    moves = diagonal_moves
  end

end
