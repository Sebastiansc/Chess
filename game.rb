require 'byebug'
require_relative 'board'
require_relative 'display'
require_relative 'player'

class Game

    def initialize(name1, name2)
      @board = Board.new
      @display = Display.new(@board)
      @player2 = Player.new(:black, name2, @display)
      @player1 = Player.new(:white, name1, @display)
      @current_player = @player1
    end

    def play
      # byebug
      until @board.checkmate?(@current_player.color)
        @display.render
        start = @current_player.play_turn
        end_pos = @current_player.play_turn
        @board.move_piece(@current_player.color, start, end_pos)
        next_player!
      end
    end

    def next_player!
      @current_player = @current_player == @player1 ? @player2 : @player1
    end
end

game = Game.new("bob", "billy")
game.play
