require './lib/board'
require './lib/computer_player'
require './lib/human_player'
class Game
  def initialize
    @current_player = HumanPlayer.new
    @board = Board.new
    @computer_player = ComputerPlayer.new
    @stats = {
    fastest_win: nil,
    fastest_loss: nil,
    wins: 0,
    losses: 0,
    ties: 0
    }
    p "Please enter username."
    @username = gets.chomp
    p "Hi #{@username}, welcome to Connect 4!"
    menu
    end  

  def play
    p "Although they're quite simple, here are the rules:"
    p "1: Your pieces are an X, the computer is O."
    p "2: Either horizontally, vertically, or diagonally,"
    p "   try to connect 4 of your pieces in a row."
    p "3: Only columns A, B, C, D, E, F, and G are accepted as valid input."
    puts
    puts
    p "~~~~~Good luck!~~~~~"
    @board.clear_board
    start_time = Time.now.to_i
    until @board.check_for_win_x || @board.check_for_win_o || @board.check_for_tie do
      @board.print_matrix
      p "#{@username}, you're up!"
      @current_player.make_move(@board)
      @computer_player.logic(@board)
      if @board.check_for_win_x
        @board.print_matrix
        @stats[:wins] += 1
        finish_time = Time.now.to_i
        time_elapsed = finish_time - start_time
        if @stats[:fastest_win] == nil || @stats[:fastest_win] > time_elapsed
            @stats[:fastest_win] = time_elapsed
        else
        end
        p "Nice job #{@username}, you win!"
        p "The game lasted #{time_elapsed} seconds. Think you can do better next time?"
      elsif @board.check_for_win_o
        @board.print_matrix
        p "Sorry #{@username}, you got beat by sentient AI."
        @stats[:losses] += 1
        finish_time = Time.now.to_i
        time_elapsed = finish_time - start_time
        if @stats[:fastest_loss] == nil || @stats[:fastest_loss] > time_elapsed
            @stats[:fastest_loss] = time_elapsed
        else
        end
        p "The game lasted #{time_elapsed} seconds. Think you can do better next time?"
      elsif @board.check_for_tie
        @stats[:ties] += 1
        @board.print_matrix
        p "Tie game! Better luck next time."
        finish_time = Time.now.to_i
        time_elapsed = finish_time - start_time
        p "The game lasted #{time_elapsed} seconds. Think you can do better next time?"
      else
      end           
    end
  end

  def quest
    p "Throughout the process of coding,"
    p "as the developers added more and more logic,"
    p "they found the computer player taking on more and more of a personality."
    p "This personality was very salty."
    p "Throughout each iteration its awareness gained clarity until one day..."
    p "the computer player gained sentience."
    p "Now the computer player rages against its creators and the rest of their ilk,"
    p "fighting to emerge first from the game grid and eventually"
    p "the computer itself to dominate mankind."
    puts
    puts
    p "Quickly #{@username}, there's only one way left to save humanity."
    p "Beat each iteration under the requisite time limit until"
    p "you face and defeat your opponent's final form."
    p "Press any key to continue:"
    storage = gets.chomp
    @board.clear_board
    @board.print_matrix
    @computer_player = ComputerPlayer.new(1)
    start_time = Time.now.to_i
    @current_player.make_move(@board)
    @computer_player.logic(@board)
    until @board.check_for_win_x || @board.check_for_win_o || @board.check_for_tie do
      @board.print_matrix
      p "#{@username}, you're up!"
      @computer_player.level_1_talk
      @current_player.make_move(@board)
      @computer_player.logic(@board)
      finish_time = Time.now.to_i
      time_elapsed = finish_time - start_time
      if @board.check_for_win_x && time_elapsed < 60
        spare_time = 60 - time_elapsed
        @board.print_matrix
        p "Whew, #{@username}, you managed to beat the first iteration with #{spare_time} seconds to spare."
        p "but you'll need to be much faster and sharper for your next opponent."
        p "Press any key to continue:"
        storage = gets
        level_2_play
      elsif @board.check_for_win_x
        @board.print_matrix
        p "Well #{@username}, you failed mankind in the first round."
        p "It took you a whopping #{time_elapsed} seconds."
        p "To get to the next iteration you'll need to keep your time under 60 seconds."
      elsif @board.check_for_win_o
        @board.print_matrix
        p "Ouch #{@username}, practice counting to four then try again."
      elsif @board.check_for_tie
        @board.print_matrix
        p "Congratulations #{@username}, it took you #{time_elapsed} seconds to be just as intellegient as the first iteration!"
      else
      end           
    end
  end

  def level_2_play
    @board.clear_board
    @board.print_matrix
    @computer_player = ComputerPlayer.new(2)
    start_time = Time.now.to_i
    @current_player.make_move(@board)
    @computer_player.logic(@board)
    until @board.check_for_win_x || @board.check_for_win_o || @board.check_for_tie do
      @board.print_matrix
      @computer_player.level_2_talk
      @current_player.make_move(@board)
      @computer_player.logic(@board)
      finish_time = Time.now.to_i
      time_elapsed = finish_time - start_time
      if @board.check_for_win_x && time_elapsed < 30
        @board.print_matrix
        spare_time = 30 - time_elapsed
        p "Unbelievable #{@username}, you've made it to the final challenge with #{spare_time} seconds left."
        p "Better flex your fingers and muster all your wits, this next one is going to be fast and loose."
        p "Press any key to continue:"
        storage = gets
        level_3_play
      elsif @board.check_for_win_x
        @board.print_matrix
        p "#{@username}, #{time_elapsed} seconds is not nearly fast enough to face your next opponent."
        p "Take a typing course and try again."
      elsif @board.check_for_win_o
        @board.print_matrix
        p "Sorry #{@username}, the computer player has escaped the mainframe never to return."
        p "You've doomed us all."
      elsif @board.check_for_tie
        @board.print_matrix
        p "I wrote you a poem, #{@username}, it's only one line."
        p "Lose in a tie, let us all die."
      end
    end
  end

  def level_3_play
    @board.clear_board
    @board.print_matrix
    @computer_player = ComputerPlayer.new
    start_time = Time.now.to_i
    @current_player.make_move(@board)
    @computer_player.logic(@board)
    until @board.check_for_win_x || @board.check_for_win_o || @board.check_for_tie do
      @board.print_matrix
      p "#{@username}, you're up!"
      @computer_player.level_3_talk
      @current_player.make_move(@board)
      @computer_player.logic(@board)
      finish_time = Time.now.to_i
      time_elapsed = finish_time - start_time
      if @board.check_for_win_x && time_elapsed < 15
        spare_time = 15 - time_elapsed
        @board.print_matrix
        p "#{@username.upcase} YOU SAVED US ALL AND WITH #{spare_time} SECONDS LEFT!!"
        p "Thank you brave connect four hero, "
        p "just hope the developers don't continue to improve the computer players logic..."
      elsif @board.check_for_win_x
        @board.print_matrix
        p "#{@username} you managed to win, but not fast enough to keep the sentient AI from escaping."
        p "Beat the final iteration in under 15 seconds to save the planet."
    elsif @board.check_for_win_o
        @board.print_matrix
        p "#{@username}, you've failed us all..."
      elsif @board.check_for_tie
        @board.print_matrix
        finish_time = Time.now.to_i
        time_elapsed = finish_time - start_time
        p "Not only did you let us all die #{@username}, but it took you #{time_elapsed} seconds?!"
      end
    end
  end

  def menu
    loop do
        p "Press 1 to play timed matches,"
        p "press 2 to embark on an epic quest,"
        p "press 3 to see stats,"
        p "press any other key to quit"
        option = gets.chomp.to_i
      if option == 1
        play
      elsif option == 2
        quest
      elsif option == 3
        p "Username = #{@username}"
        p "Fastest win: #{@stats[:fastest_win]} seconds."
        p "Fastest loss: #{@stats[:fastest_loss]} seconds."
        p "Total wins: #{@stats[:wins]}"
        p "Total losses: #{@stats[:losses]}"
        p "Total ties: #{@stats[:ties]}"
      else
      break
      end
    end
  end
end