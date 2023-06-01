require './lib/board'
require './lib/computer_player'
require './lib/human_player'
class Game
  def initialize
    @current_player = HumanPlayer.new
    @board = Board.new
    @computer_player = ComputerPlayer.new
    p "Please enter username."
    @username = gets.chomp
    p "Hi #{@username}, welcome to Connect 4!"
    p "Although they're quite simple, here are the rules:"
    p "1: Your pieces are an X, the computer is O."
    p "2: Either horizontally, vertically, or diagonally,"
    p "   try to connect 4 of your pieces in a row."
    p "3: Only columns A, B, C, D, E, F, and G are accepted as valid input."
    puts
    puts
    p "~~~~~Good luck!~~~~~"
    end  

  def play
    start_time = Time.now.to_i
    until @board.check_for_win_x || @board.check_for_win_o || @board.check_for_tie do
      @board.print_matrix
      p "#{@username}, you're up!"
      @current_player.make_move(@board)
      @computer_player.logic(@board)
      if @board.check_for_win_x
        @board.print_matrix
        finish_time = Time.now.to_i
        time_elapsed = finish_time - start_time
        p "Nice job #{@username}, you win!"
        p "The game lasted #{time_elapsed} seconds. Think you can do better next time?"
      elsif @board.check_for_win_o
        @board.print_matrix
        p "Sorry #{@username}, you got beat by sentient AI."
        finish_time = Time.now.to_i
        time_elapsed = finish_time - start_time
        p "The game lasted #{time_elapsed} seconds. Think you can do better next time?"
      elsif @board.check_for_tie
        @board.print_matrix
        p "Tie game! Better luck next time."
        finish_time = Time.now.to_i
        time_elapsed = finish_time - start_time
        p "The game lasted #{time_elapsed} seconds. Think you can do better next time?"
      else
      end           
    end
  end

  def menu
    loop do
      p "Play another? Type 1 to play again or press any other key to quit."
      round = gets.chomp.to_i
      if round == 1
        @board.clear_board
        play
      else
      break
      end
    end
  end
end