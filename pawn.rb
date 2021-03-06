require_relative 'piece'

class Pawn < Piece

  def initialize(color, board, position)
    super(color, board, position)
    @start_row = @position
  end

  def at_start_row?
    @start_row == @position
  end

  def forward_dir
    at_start_row? ? 2 : 1
  end

  def steps(offset)
    if at_start_row?
         [
          [@position[0] + offset, position[1]],
          [@position[0] + (offset * 2) , position[1]]
        ]
    else
      [
        [@position[0] + offset, position[1]]
      ]
    end
  end

  def move_dirs
    if @color == :white
      steps(1)
    else
      steps(-1)
    end
  end

  def valid_moves
    forward = move_dirs.select { |pos| @board[pos].is_a?(NullPiece) }
    forward + attacks
  end

  def symbol
    @color == :white ? " ♙ " : " ♟ "
  end

  def attacks
    # byebug
    pos = [
      [@position[0] + 1, @position[1] + 1],
      [@position[0] + 1, @position[1] - 1]
    ]
    pos = pos.reject { |pos| pos.any? { |n| n < 0 || n > 7} }
    pos.select do |pos|
      @board[pos].color != color && !@board[pos].is_a?(NullPiece)
    end
  end

  def valid_attack?
    side_attacks.any?{ |pos| @board[pos].color != color }
  end
end
