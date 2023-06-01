class HumanPlayer
  def make_move(board)
    print "Choose a column A-G: "
    column = gets.chomp.upcase
    if board.insert_x(column)
      true
    else
      p "Invalid selection, please try again."
      make_move(board)
    end
  end
end
