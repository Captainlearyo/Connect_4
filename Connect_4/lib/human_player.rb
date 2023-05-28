require './lib/insertable'
class HumanPlayer
include Insertable

  def initialize
  end

  def make_move(board)
    loop do
      print "Choose a column A-G: "
      column = gets.chomp.upcase
        insert_x(column)
        break
    end
  end
end
