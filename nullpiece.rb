require 'singleton'

class NullPiece
  include Singleton

  def color
    nil
  end

  def to_s
    " # "
  end

  def empty?
    true
  end

  def color
    :purple
  end

  def valid_moves
    []
  end
end
