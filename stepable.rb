
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




# board = Board.new
# board.add_piece(Knight.new(:black, board, [7,4]))
# k = Knight.new(:white, board,[5,5])
# p k.move_dirs
# p k.valid_moves
