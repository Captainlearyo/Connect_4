require "./lib/human_player"

class ComputerPlayer < HumanPlayer
  def make_move(board)
    column = find_valid_column(board)
    board.add_o(column)
  end
end