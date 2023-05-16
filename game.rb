require_relative "card.rb"
require_relative "board.rb"

class Game
  def initialize
    @board = Board.new
    @player = Player.new

  end



  def play
    until @board.won?
      @board.render
      make_guess
      system("clear")
    end
  end

  def make_guess
    p "enter position"
    pos = gets.chomp.split.map(&:to_i)
    previous_guess = @board[pos]
    previous_guess.reveal
    @board.render


    p "enter another position"
    pos = gets.chomp.split.map(&:to_i)
    @board[pos].reveal
    @board.render

    if previous_guess.value == @board[pos].value
      p "nice!"
    else
      p "nope!"
      sleep(3)
      previous_guess.hide
      @board[pos].hide
    end
  end









end
