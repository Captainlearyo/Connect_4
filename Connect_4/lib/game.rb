require './lib/board'
require './lib/computer_player'
class Game
    def initialize
       @current_player = HumanPlayer.new
       @board = Board.new
       @computer_player = ComputerPlayer.new
       @player_wins = 0
       
    end  

    def play
       loop do
            @board.print_matrix
            @current_player.make_move(@board)
            @computer_player.make_move(@board)
            break if !@board.check_for_win && !@board.check_for_tie
        end
    end

    # def switch_players
    #     if @current_player == @human_player
    #       @current_player = @computer_player
    #     else
    #       @current_player = @human_player
    #     end
    #   end
end