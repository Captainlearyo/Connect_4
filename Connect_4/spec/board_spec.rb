require 'spec_helper'

RSpec.describe Board do
 
  board = Board.new

  describe '#initialize board' do
    it 'can initialize empty board' do
      expect(board).to be_an_instance_of(Board)
    end

   
    it 'can add paice' do
      expect(board).to be_an_instance_of(Board)
  
      board.print_matrix
      board.add_o('A')
      board.add_o('B')
      board.add_o('C')
      board.add_o('D')
      
      
          
    end
  end

end
