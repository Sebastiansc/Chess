require_relative 'display'

class Player

  attr_reader :name, :color
  def initialize(color, name, display)
    @display = display
    @name = name
    @color = color
  end

  def play_turn
    pos = nil
    loop do
      # byebug
      pos = @display.cursor.get_input
      @display.render(@color)
      break if pos
    end
    pos
  end

end
