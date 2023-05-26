class Board
    
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
 
    @colums = ["A", "B", "C", "D", "E", "F", "G"]

  end  
 
  def add_x(x)
    if @colums.include?(x) && @bases[x][0] > -1
    #base = @matrix[@bases[x][0]][@bases[x][1]]
    @matrix[@bases[x][0]][@bases[x][1]]  = "X"
    @bases[x][0] -= 1
    @matrix
    else
      p "Please enter valid input"
    end
    print_matrix
    check_for_win
    check_fo_tie
  end

  def add_o(x)
    if @colums.include?(x) && @bases[x][0] > -1
     #base = @matrix[@bases[x][0]][@bases[x][1]]
      @matrix[@bases[x][0]][@bases[x][1]]  = "O"
      @bases[x][0] -= 1
      @matrix
      else
        p "Please enter valid input"
      end
      print_matrix
      check_for_win
      check_fo_tie
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

  def check_fo_tie
    if !@matrix.join.include?(".")
      p "TIE GAME"
      true
    end
  end

  def check_for_win
    if check_colums || check_rows || check_diagnal
      p "Winner"
      true
    end
  end

  def check_colums
    m = @matrix
    col_A = [m[0][0], m[1][0], m[2][0],m[3][0],m[4][0], m[5][0]].join
    col_B = [m[0][1], m[1][1], m[2][1],m[3][1],m[4][1], m[5][1]].join
    col_C = [m[0][2], m[1][2], m[2][2],m[3][2],m[4][2], m[5][2]].join
    col_D = [m[0][3], m[1][3], m[2][3],m[3][3],m[4][3], m[5][3]].join
    col_E = [m[0][4], m[1][4], m[2][4],m[3][4],m[4][4], m[5][4]].join
    col_F = [m[0][5], m[1][5], m[2][5],m[3][5],m[4][5], m[5][5]].join
    col_G = [m[0][6], m[1][6], m[2][6],m[3][6],m[4][6], m[5][6]].join

    
    if col_A.include?("XXXX") || col_B.include?("XXXX") || col_C.include?("XXXX") || col_D.include?("XXXX") || col_E.include?("XXXX") || col_F.include?("XXXX") || col_G.include?("XXXX") 
     true
    elsif col_A.include?("OOOO") || col_B.include?("OOOO") || col_C.include?("OOOO") || col_D.include?("OOOO") || col_E.include?("OOOO") || col_F.include?("OOOO") || col_G.include?("OOOO") 
      true
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

    if row_1.include?("XXXX")  || row_2.include?("XXXX")  || row_3.include?("XXXX")  || row_4.include?("XXXX")  || row_5.include?("XXXX")  || row_6.include?("XXXX") 
      true
    elsif row_1.include?("OOOO") || row_2.include?("OOOO") || row_3.include?("OOOO") || row_4.include?("OOOO") || row_5.include?("OOOO") || row_6.include?("OOOO")
      true
    end
  end

  def check_diagnal
    m = @matrix
    diag_1 = [m[3][0], m[2][1], m[1][2],m[0][3]].join
    diag_2 = [m[4][0], m[3][1], m[2][2],m[1][3],m[0][4]].join
    diag_3 = [m[5][0], m[4][1], m[3][2],m[2][3],m[1][4], m[0][5]].join
    diag_4 = [m[5][1], m[4][2], m[3][3],m[2][4],m[1][5]].join
    diag_5 = [m[5][2], m[4][3], m[3][4],m[2][5]].join
    diag_6 = [m[5][3], m[4][4], m[3][5],m[2][6]].join
     
    diag_arr = [diag_1, diag_2, diag_3, diag_4, diag_5, diag_6]
    if diag_1.include?("XXXX")  || diag_2.include?("XXXX")  || diag_3.include?("XXXX")  || diag_4.include?("XXXX")  || diag_5.include?("XXXX")  || diag_6.include?("XXXX") 
      true
    elsif diag_1.include?("OOOO") || diag_2.include?("OOOO") || diag_3.include?("OOOO") || diag_4.include?("OOOO") || diag_5.include?("OOOO") || diag_6.include?("OOOO")
      true
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





                  
                  