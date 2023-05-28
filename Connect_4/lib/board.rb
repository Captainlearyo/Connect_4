require './lib/insertable'
class Board
  include Insertable
  def initialize
    @matrix = [
      [".",".",".",".",".",".","."],
      [".",".",".",".",".",".","."],
      [".",".",".",".",".",".","."],
      [".",".",".",".",".",".","."],
      [".",".",".",".",".",".","."],
      [".",".",".",".",".",".","."],
    ] 

    @bases = {
     'A' => [5,0],
     'B' => [5,1],
     'C' => [5,2],
     'D' => [5,3],
     'E' => [5,4],
     'F' => [5,5],
     'G' => [5,6]
    }

    @columns = ["A", "B", "C", "D", "E", "F", "G"]
  end  

  def print_matrix
   df = Daru::DataFrame.new(
    {
        "1" => @matrix[0],
        "2" => @matrix[1],
        "3" => @matrix[2],
        "4" => @matrix[3],
        "5" => @matrix[4],
        "6" => @matrix[5]
      },
       index: ["A", "B", "C", "D", "E", "F", "G"]
     )
     p df.transpose
  end

  def check_for_tie
    if !@matrix.join.include?(".")
      p "TIE GAME"
      true
    else 
      false
    end
  end

  def check_for_win
    if check_columns || check_rows || check_diagonal
      p "Winner"
      true
    else
      false
    end
  end

  def check_columns
    m = @matrix
    col_A = [m[0][0], m[1][0], m[2][0],m[3][0],m[4][0], m[5][0]].join
    col_B = [m[0][1], m[1][1], m[2][1],m[3][1],m[4][1], m[5][1]].join
    col_C = [m[0][2], m[1][2], m[2][2],m[3][2],m[4][2], m[5][2]].join
    col_D = [m[0][3], m[1][3], m[2][3],m[3][3],m[4][3], m[5][3]].join
    col_E = [m[0][4], m[1][4], m[2][4],m[3][4],m[4][4], m[5][4]].join
    col_F = [m[0][5], m[1][5], m[2][5],m[3][5],m[4][5], m[5][5]].join
    col_G = [m[0][6], m[1][6], m[2][6],m[3][6],m[4][6], m[5][6]].join  
    if [col_A, col_B, col_C, col_D, col_E, col_F, col_G].any? { |col| col.include?("XXXX") || col.include?("OOOO") }
      true
    else
      false
    end
  end

  def check_rows
    m = @matrix
    row_6 = m[0].join
    row_5 = m[1].join
    row_4 = m[2].join
    row_3 = m[3].join
    row_2 = m[4].join
    row_1 = m[5].join
    if [row_1, row_2, row_3, row_4, row_5, row_6].any? { |row| row.include?("XXXX") || row.include?("OOOO") }
      true
    else
      false
    end
  end

  def check_diagonal
    m = @matrix
    diag_1 = [m[3][0], m[2][1], m[1][2],m[0][3]].join
    diag_2 = [m[4][0], m[3][1], m[2][2],m[1][3],m[0][4]].join
    diag_3 = [m[5][0], m[4][1], m[3][2],m[2][3],m[1][4], m[0][5]].join
    diag_4 = [m[5][1], m[4][2], m[3][3],m[2][4],m[1][5], m[0][6]].join
    diag_5 = [m[5][2], m[4][3], m[3][4],m[2][5], m[1][6]].join 
    diag_6 = [m[5][3], m[4][4], m[3][5],m[2][6]].join
    diag_7 = [m[0][3], m[1][4], m[2][5],m[3][6]].join
    diag_8 = [m[0][2], m[1][3], m[2][4],m[3][5], m[4][6]].join
    diag_9 = [m[0][0], m[1][1], m[2][2],m[3][3], m[4][4], m[5][5]].join
    diag_10 = [m[0][1], m[1][2], m[2][3],m[3][4],m[4][5], m[5][6]].join
    diag_11 = [m[1][0], m[2][1], m[3][2],m[4][3],m[5][4]].join
    diag_12 = [m[2][0], m[3][1], m[4][2],m[5][3]].join
    diag_arr = [diag_1, diag_2, diag_3, diag_4, diag_5, diag_6, diag_7, diag_8, diag_9, diag_10, diag_11, diag_12]
    if diag_arr.any? {|diagonal| diagonal.include?("XXXX") || diagonal.include?("OOOO")}
      true
    else
      false
    end
  end

  def clear_board
    @matrix = [
      [".",".",".",".",".",".","."],
      [".",".",".",".",".",".","."],
      [".",".",".",".",".",".","."],
      [".",".",".",".",".",".","."],
      [".",".",".",".",".",".","."],
      [".",".",".",".",".",".","."],
    ] 

    @bases = {
     'A' => [5,0],
     'B' => [5,1],
     'C' => [5,2],
     'D' => [5,3],
     'E' => [5,4],
     'F' => [5,5],
     'G' => [5,6]
    }
    print_matrix
  end
end





                  
                  