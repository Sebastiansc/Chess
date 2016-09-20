require_relative 'nullpiece'
require_relative 'piece'
require_relative 'king'
require_relative 'queen'
require_relative 'rook'
require_relative 'knight'
require_relative 'bishop'
require_relative 'pawn'
require 'byebug'

class Board
  PIECES = {
    "Pawn" => [[1,0], [1,1], [1,2], [1,3], [1,4], [1,5], [1,6], [1,7]],
    "Rook" => [[0,0], [0,7]],
    "Knight" => [[0,1], [0,6]],
    "Bishop" => [[0,2], [0,5]],
    "Queen" => [[0,3]],
    "King" => [[0,4]]
  }

  attr_reader :grid

  def initialize
    @grid = Array.new(8) { Array.new(8) }
    make_starting_grid
  end

  def make_starting_grid
    # byebug
    # PIECES.each do |piece, positions|
    #   offset = piece == "Pawn" ? 5 : 7
    #   positions.each do |pos|
    #     piece1 = Object.const_get(piece).new(:black, self, pos)
    #     piece2 = Object.const_get(piece).new(:white, self, [pos[0] + offset, pos[1]])
    #     add_piece(piece1)
    #     add_piece(piece2)
    #   end
    # end
    fill_nulls
    @grid
  end

  def fill_nulls
    @grid.each do |row|
      row.map!{ |tile| tile.nil? ? NullPiece.instance : tile }
    end
  end

  def add_piece(piece)
    self[piece.position] = piece
  end

  def move_piece(color, start, end_pos)
      raise "Empty square, try a new start position" if self[start].is_a?(NullObject)
      raise "occupied" if self[start].color == self[end_pos].color
      self[end_pos] = self[start]
      self[start].position = end_pos
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

  def in_check?(color)
    attack_range(color).find{|pos| pos == king.pos }.nil? ? false : true
  end

  def check_mate?(color)
    king = find_king
    if in_check?(color)
      @self[king].valid_moves.all?{|move| attack_range(color).include?(move)}
    end
  end

  def attack_range(color)
    # byebug
    attacks = []
    @grid.each do |row|
      row.each do |tile|
        unless tile.color == color && tile.is_a?(NullPiece)
          attacks.concat(tile.valid_moves)
        end
      end
    end
    attacks
  end


  def king(color)
    @grid.flatten.find{ |piece| piece.is_a?(King) && color == piece.color}
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

b = Board.new()
b.add_piece(King.new(:white, b ,[0,0]))
b.add_piece(Queen.new(:black,b ,[1,0]))
p b.in_check?(:white)
