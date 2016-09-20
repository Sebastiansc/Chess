require_relative 'piece'
require 'byebug'

module Stepable

  def move_directions(constant)
    moves = {}

    constant.each do |direction|
      move = [@position[0] + direction[0], @position[1] + direction[1]]
      moves[direction] ||= []
      moves[direction] << move if in_bound?(move)
    end

    moves
  end

  def in_bound?(move)
    move.none? {|pos| pos > 7 || pos < 0}
  end
end

class Knight < Piece
  include Stepable

  JUMPS = [
    [1, 2],
    [1, -2],
    [2, 1],
    [2, -1],
    [-2, -1],
    [-2, 1],
    [-1, -2],
    [-1 , 2]
  ]

  def symbol
    @color == :white ? ♘ : ♞
  end

  def move_dirs
    moves = move_directions(JUMPS)
  end

  def valid_moves
    valids = []

    move_dirs.each do |_,value|
      value.each do |pos|
        if @board[pos].is_a?(NullPiece) || @board[pos].color != color
          valids << pos
        end
      end
    end

    valids
  end


end

class King < Piece
  include Stepable

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

  def initialize(color, position)
    @color = color
    @position = position
  end

  def move_dirs
    moves = move_directions(STEPS)
  end

end

# board = Board.new
# board.add_piece(Knight.new(:black, board, [7,4]))
# k = Knight.new(:white, board,[5,5])
# p k.move_dirs
# p k.valid_moves
