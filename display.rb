require 'colorize'
require_relative 'cursorable'
require_relative 'board'
require 'byebug'

class Display

  def initialize
    @board = Board.new
    @cursor = Cursor.new([0,0], @board)
  end

  def render
    output = ""

    @board.grid.each_with_index do |row, row_idx|
      row.each_with_index do |tile, tile_idx|
        board_string = " # "
        if @cursor.cursor_pos == [row_idx, tile_idx]
          board_string = board_string.colorize(:green)
        end
        output << board_string
      end
      output << "\n"
    end
    puts output
    puts "-" * 24
  end

  def user_get_input
    @cursor.get_input
  end

  def show_board
    render
  end

end

d = Display.new()
d.render
d.user_get_input
d.render