class Pawn

  def initialize
    @symbol = symbol
    @position = position
    @start_row = position
  end

  def at_start_row?
    @start_row == @position
  end

  def forward_dir
    at_start_row? ? 2 : 1
  end

  def side_attacks
    [
      [@position[0] + 1, @position[1] + 1],
      [@position[0] + 1, @position[1] - 1]
    ]
  end

  def valid_attack?
    side_attacks.select{ |pos| @board[pos].color != color } 
  end
end
