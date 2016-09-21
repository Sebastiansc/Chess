require 'colorize'
require_relative 'cursorable'
require_relative 'board'
require 'byebug'

class Display

  attr_reader :cursor
  def initialize(board)
    @board =  board
    @cursor = Cursor.new([0,0], @board)
  end

  def render(color)
    output = ""
    moves = piece_moves(color)

    @board.grid.each_with_index do |row, row_idx|
      row.each_with_index do |tile, tile_idx|
        if @cursor.cursor_pos == [row_idx, tile_idx]
          output << tile.to_s.colorize(:green)
        elsif moves.include?([row_idx,tile_idx])
          output << tile.to_s.colorize(:blue)
        else
          output << tile.to_s
        end
      end
      output << "\n"
    end

    puts output
    puts "-" * 24
  end

  def piece_moves(color)
    if @board[@cursor.cursor_pos].color != color
      @board[@cursor.cursor_pos].valid_moves
    else
      []
    end
  end

  def show_board
    render
  end

end
