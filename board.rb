require_relative 'nullpiece'

class Board

  attr_reader :grid

  def initialize
    @grid = Array.new(8) { Array.new(8) }
    make_startin_grid
  end

  def move_piece(color, start, end_pos)
      raise "Empty square, try a new start position" if self[start].is_a?(NullObject)
      raise "occupied" if self[start].color == self[end_pos].color
      self[end_pos] = self[start]
      self[start] = NullObject
    rescue RunTimeError => e
      puts e.message

  end

  def make_startin_grid
    positions.each{ |pos| self[pos] = NullPiece.instance }
  end

  def positions
    @positions ||= (0..7).to_a.repeated_permutation(2).to_a
  end

  def in_bounds(pos)
    pos.none? {|position| position > 7 || position < 0}
  end

  def [](pos)
    row, col = pos
    @grid[row][col]
  end

  def []=(pos, value)
    row, col = pos
    @grid[row][col] = value
  end

end
