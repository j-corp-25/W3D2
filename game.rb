require_relative "card.rb"
require_relative "board.rb"
require_relative "player.rb"

require "byebug"

class Game
  def initialize
    @board = Board.new
    @player = Player.new
  end



  def play
    @board.populate

    until @board.won?
      system("clear")
      @board.render
      make_guess
    end

  end

  def make_guess
    p "enter position"
    pos = gets.chomp.split.map(&:to_i)
    previous_guess = @board[pos]
    previous_guess.reveal
    @board.render

    system("clear")

    @board.render
    p "enter another position"
    pos = gets.chomp.split.map(&:to_i)
    @board[pos].reveal

    # system("clear")
    @board.render
    if previous_guess.value == @board[pos].value
      p "nice!"
    else
      p "nope!"
      sleep(2)
      previous_guess.hide
      @board[pos].hide
    end
  end

end

g1 = Game.new
g1.play