require 'pry'
require 'daru'
require './lib/board'
RSpec.describe Board do
  describe '#initialize board' do
    board = Board.new
    it 'can instantiate a board' do
      expect(board).to be_an_instance_of(Board)
    end

    it 'can display the board' do
      expected =  <<~OUTPUT
      #<Daru::DataFrame(6x7)>
             A   B   C   D   E   F   G
         1   .   .   .   .   .   .   .
         2   .   .   .   .   .   .   .
         3   .   .   .   .   .   .   .
         4   .   .   .   .   .   .   .
         5   .   .   .   .   .   .   .
         6   .   .   .   .   .   .   .
    OUTPUT
      expect{board.print_matrix}.to output(expected).to_stdout
    end

    it 'can insert pieces' do
      board.insert_x("A")
      board.insert_x("B")
      board.insert_x("C")
      board.insert_o("D")
      expected = <<~OUTPUT
      #<Daru::DataFrame(6x7)>
             A   B   C   D   E   F   G
         1   .   .   .   .   .   .   .
         2   .   .   .   .   .   .   .
         3   .   .   .   .   .   .   .
         4   .   .   .   .   .   .   .
         5   .   .   .   .   .   .   .
         6   X   X   X   O   .   .   .
    OUTPUT
      expect{board.print_matrix}.to output(expected).to_stdout
    end

    it 'can tell when a column is full' do
      board.insert_x("A")
      board.insert_x("A")
      board.insert_o("A")
      board.insert_o("A")
      board.insert_x("A")
      expected = <<~OUTPUT
      #<Daru::DataFrame(6x7)>
             A   B   C   D   E   F   G
         1   X   .   .   .   .   .   .
         2   O   .   .   .   .   .   .
         3   O   .   .   .   .   .   .
         4   X   .   .   .   .   .   .
         5   X   .   .   .   .   .   .
         6   X   X   X   O   .   .   .
      OUTPUT
      expect{board.print_matrix}.to output(expected).to_stdout
      expect(board.insert_x("A")).to eq(false)
    end
  end
  
  describe 'check methods' do
    board = Board.new
    it 'can check for valid input' do
      board.insert_x("B")
      expect(board.insert_x("Z")).to eq(false)
    end

    it 'can check for a vertical win' do
      board.insert_x("A")
      board.insert_x("A")
      board.insert_x("A")
      board.insert_x("A")
      expect(board.check_for_win_x).to eq true
    end
    
    it 'wont trigger a win with four xs not in a row' do
      board = Board.new
      board.insert_x("A")
      board.insert_o("A")
      board.insert_x("A")
      board.insert_x("A")
      expect(board.check_for_win_x).to eq false
    end

    it 'will still register a win even if there is an o' do
      board = Board.new
      board.insert_x("A")
      board.insert_o("A")
      board.insert_x("A")
      board.insert_x("A")
      board.insert_x("A")
      board.insert_x("A")
      expected = <<~OUTPUT
      #<Daru::DataFrame(6x7)>
             A   B   C   D   E   F   G
         1   X   .   .   .   .   .   .
         2   X   .   .   .   .   .   .
         3   X   .   .   .   .   .   .
         4   X   .   .   .   .   .   .
         5   O   .   .   .   .   .   .
         6   X   .   .   .   .   .   .
      OUTPUT
      expect{board.print_matrix}.to output(expected).to_stdout
      expect(board.check_for_win_x).to eq true
    end

    it 'will register a win for os' do
      board = Board.new
      board.insert_o("A")
      board.insert_o("A")
      board.insert_o("A")
      board.insert_o("A")
      expected = <<~OUTPUT
      #<Daru::DataFrame(6x7)>
             A   B   C   D   E   F   G
         1   .   .   .   .   .   .   .
         2   .   .   .   .   .   .   .
         3   O   .   .   .   .   .   .
         4   O   .   .   .   .   .   .
         5   O   .   .   .   .   .   .
         6   O   .   .   .   .   .   .
      OUTPUT
      expect{board.print_matrix}.to output(expected).to_stdout
      expect(board.check_for_win_o).to eq true
    end

    it 'can check for a horizontal win' do
      board = Board.new
      board.insert_x("A")
      board.insert_x("B")
      board.insert_x("C")
      board.insert_x("D")
      expected = <<~OUTPUT
#<Daru::DataFrame(6x7)>
       A   B   C   D   E   F   G
   1   .   .   .   .   .   .   .
   2   .   .   .   .   .   .   .
   3   .   .   .   .   .   .   .
   4   .   .   .   .   .   .   .
   5   .   .   .   .   .   .   .
   6   X   X   X   X   .   .   .
      OUTPUT
      expect{board.print_matrix}.to output(expected).to_stdout
      expect(board.check_for_win_x).to eq true
    end

    it 'can check for a diagonal win' do
      board.insert_x("A")
      board.insert_x("B")
      board.insert_o("C")
      board.insert_o("D")
      board.insert_x("E")
      board.insert_x("B")
      board.insert_x("C")
      board.insert_x("C")
      board.insert_x("D")
      board.insert_x("D")
      expected = <<~OUTPUT
      #<Daru::DataFrame(6x7)>
             A   B   C   D   E   F   G
         1   .   .   .   .   .   .   .
         2   .   .   .   .   .   .   .
         3   .   .   X   X   .   .   .
         4   .   X   X   X   .   .   .
         5   X   X   O   O   .   .   .
         6   X   X   X   X   X   .   .
      OUTPUT
      expect{board.print_matrix}.to output(expected).to_stdout
      expect(board.check_for_win_x).to eq true
    end

    it 'can verify wins in opposing diagonals' do
      board = Board.new
      board.insert_o("G")
      board.insert_x("F")
      board.insert_o("F")
      board.insert_o("E")
      board.insert_x("E")
      board.insert_o("E")
      board.insert_x("D")
      board.insert_x("D")
      board.insert_o("D")
      board.insert_o("D")
      expected = <<~OUTPUT
      #<Daru::DataFrame(6x7)>
             A   B   C   D   E   F   G
         1   .   .   .   .   .   .   .
         2   .   .   .   .   .   .   .
         3   .   .   .   O   .   .   .
         4   .   .   .   O   O   .   .
         5   .   .   .   X   X   O   .
         6   .   .   .   X   O   X   O
      OUTPUT
      expect{board.print_matrix}.to output(expected).to_stdout
      expect(board.check_for_win_o).to eq true
    end
  end
end