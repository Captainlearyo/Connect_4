

class ComputerPlayer
  def initialize
  end

  def make_move(board)
    columns = ["A", "B", "C", "D", "E", "F", "G"]
    column = columns.sample
    if board.insert_o(column)
      true
    else
      make_move(board)
    end
  end
end