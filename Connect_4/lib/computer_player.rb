require "./lib/insertable"

class ComputerPlayer
include Insertable
  def initialize
  end

  def make_move(board)
    columns = ["A", "B", "C", "D", "E", "F", "G"]
    column = columns.sample
    if valid_column?(column)
      board.insert_o(column)
    else
      make_move(board)
    end
  end
end