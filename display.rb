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

  def render
    output = ""
    piece_moves = @board[@cursor.cursor_pos].valid_moves

    @board.grid.each_with_index do |row, row_idx|
      row.each_with_index do |tile, tile_idx|
        if @cursor.cursor_pos == [row_idx, tile_idx]
          output << tile.to_s.colorize(:green)
        elsif piece_moves.include?([row_idx,tile_idx])
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


  def show_board
    render
  end

end
