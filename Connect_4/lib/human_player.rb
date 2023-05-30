class HumanPlayer
<<<<<<< HEAD

=======
>>>>>>> 1b133e8b109541404cef045ab8e0e2138a5dea8a

  def initialize
  end

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
