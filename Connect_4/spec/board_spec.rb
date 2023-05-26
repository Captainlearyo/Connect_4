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
      board.add_x('A')
      board.print_matrix
      board.add_x('B')
      board.print_matrix
      board.add_x('A')
      board.print_matrix
      expect(board.add_x('L')).to eq("Please enter valid input")
      board.add_x('A')
      board.add_x('A')
      board.add_x('A')
      board.add_x('A')
      board.print_matrix
      expect(board.add_x('A')).to eq("Please enter valid input")
      board.print_matrix
      board.add_o('G')
      board.print_matrix
                              
    end
  end

end
