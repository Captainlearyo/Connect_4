require 'spec_helper'

RSpec.describe Board do
 
  board = Board.new

  describe '#initialize board' do
    it 'can initialize empty board' do
      expect(board).to be_an_instance_of(Board)
    end

   
    it 'can add' do
      expect(board).to be_an_instance_of(Board)
  
      board.print_matrix 
      board.add_x("A")
      board.add_x("B")
      board.add_x("C")
      board.add_o("D")
      board.add_x("E")
      board.add_x("B")
      board.add_x("C")
      board.add_x("C")
      board.add_x("D")
      board.add_x("D")
      board.add_x("D")
      

    

      

      

          
    end
  end

end
