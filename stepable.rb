require_relative 'piece'
require 'byebug'

module Stepable

  def move_directions(constant)
    moves = []

    constant.each do |direction|
      move = [@position[0] + direction[0], @position[1] + direction[1]]
      moves << move if in_bound?(move)
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

  def initialize(color, position)
    @color = color
    @position = position
  end

  def move_dirs
    moves = move_directions(JUMPS)
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

k = King.new(:white, [5,5])
p k.move_dirs
