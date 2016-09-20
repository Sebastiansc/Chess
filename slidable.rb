
require_relative 'piece'
require_relative 'board'
require 'byebug'

module Slidable
  STRAIGHT = [
    [0, 1],
    [0, -1],
    [1, 0],
    [-1, 0]
  ]

  DIAGONAL = [
    [1, 1],
    [1, -1],
    [-1, 1],
    [-1, -1]
  ]

  def diagonal_moves
    move_directions(DIAGONAL)
  end

  def straight_moves
    move_directions(STRAIGHT)
  end

    def move_directions(constant)
      moves = {}

      constant.each do |direction|
        move = [@position[0] + direction[0], @position[1] + direction[1]]
        while in_bounds(move)
          moves[direction] ||= []
          moves[direction] << move
          move = [move[0] + direction[0], move[1] + direction[1]]
        end
      end

      moves
    end

    def in_bounds(move)
      move.none? {|pos| pos > 7 || pos < 0}
    end
end

class Queen < Piece
  include Slidable

  def move_dirs
    moves = diagonal_moves.merge(straight_moves)
  end
end

class Bishop < Piece
  include Slidable

  def symbol()
    " I "
  end

  def move_dirs
    moves = diagonal_moves
  end

end

class Rook < Piece
  include Slidable

  def symbol

  end

  def move_dirs
    moves = straight_moves
  end
end

# board = Board.new
# board.add_piece(Queen.new(:black, board, [2,2]))
# q = Queen.new(:white, board, [5,5])
# p q.move_dirs
# p q.valid_moves
