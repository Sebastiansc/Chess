class Piece


  def initialize(color, board, position)
    @color = color
    @board = board
    @moves = []
    @position = position
  end

  def to_s
    symbol
  end

  def empty?
    false
  end

  def valid_moves
    valids = []

    @moves.each do |pos|
      valids << pos if @board[pos].empty? || @board[pos].color != color
    end

    valids
  end

  def get_moves
    @pos = move_dirs
  end

  private

  def move_into_check?(to_pos)

  end


end



module SlidingPiece
end

module SteppingPiece
end
