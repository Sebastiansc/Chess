require 'byebug'
# require_relative 'board'
require_relative 'nullpiece'

class Piece

  attr_reader :color, :board
  attr_accessor :position
  def initialize(color, board,  position)
    @board = board
    @color = color
    @position = position
  end

  def to_s
    symbol
  end

  def empty?
    false
  end

  def valid_moves
    attacks.reject{ |pos| move_into_check?(pos) }
  end

  def attacks
    moves = move_dirs
    valids = []

    moves.each do |key, value|
      value.each do |pos|
        if @board[pos].is_a?(NullPiece)
          valids << pos
        elsif @board[pos].color != @color
          valids << pos
          break
        else
          break
        end
      end
    end

    valids
  end


  def pos
    @position
  end
  private

  def move_into_check?(to_pos)
    copy_board = @board.deep_dup
    copy_board.move_piece!(@color, @position, to_pos)
    copy_board.in_check?(@color)
  end
end
