require 'spec_helper'

RSpec.describe ComputerPlayer do
  describe '#logic_check_rows' do
    board = Board.new
    computer = ComputerPlayer.new
   
      
      
    it 'logic works' do
     
      
      board.insert_x('B')
      board.insert_x('C')
      board.insert_o('D')

      
     
     
      
     
      
      board.insert_o(computer.logic(board))
      board.insert_o(computer.logic(board))
      board.insert_o(computer.logic(board))

    

    end

  end

end