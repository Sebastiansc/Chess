require_relative "piece"
require_relative "stepable"

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
    @color == :white ? " ♘ " : " ♞ "
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
