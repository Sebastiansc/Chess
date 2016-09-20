require_relative "piece"
require_relative "slidable"

class Rook < Piece
  include Slidable

  def symbol
    @color == :white ? " ♖ " : " ♜ "
  end

  def move_dirs
    moves = straight_moves
  end
end
