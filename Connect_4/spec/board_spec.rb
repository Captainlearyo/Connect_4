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
          
    end
  end

end
