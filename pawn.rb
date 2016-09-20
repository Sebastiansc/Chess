require_relative 'piece'

class Pawn < Piece

  def initialize(color, board, position)
    super
    @start_row = @position
  end
  def at_start_row?
    @start_row == @position
  end

  def forward_dir
    at_start_row? ? 2 : 1
  end

  def symbol
    @color == :white ? " ♙ " : " ♟ "
  end

  def side_attacks
    [
      [@position[0] + 1, @position[1] + 1],
      [@position[0] + 1, @position[1] - 1]
    ].select do |pos|
      @board[pos].color != color && !@board[pos].is_a?(NullObject)
    end
  end

  def valid_attack?
    side_attacks.any?{ |pos| @board[pos].color != color }
  end
end
