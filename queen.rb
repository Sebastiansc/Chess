require_relative 'slidable'

class Queen < Piece
  include Slidable

  def symbol
    @color == :white ? " ♕ " : " ♛ "
  end
  def move_dirs
    moves = diagonal_moves.merge(straight_moves)
  end
end
