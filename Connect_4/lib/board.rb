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
 
    @str = ["A", "B", "C", "D","E", "F", "G"]

  end  
 
  def add_x(x)
    if @str.include?(x) && @bases[x][0] > -1
    base = @matrix[@bases[x][0]][@bases[x][1]]
    @matrix[@bases[x][0]][@bases[x][1]]  = "X"
    @bases[x][0] -= 1
    @matrix
    else
      p "Please enter valid input"
    end
    print_matrix
    check_for_win
  end

  def add_o(x)
    if @str.include?(x) && @bases[x][0] > -1
      base = @matrix[@bases[x][0]][@bases[x][1]]
      @matrix[@bases[x][0]][@bases[x][1]]  = "O"
      @bases[x][0] -= 1
      @matrix
      else
        p "Please enter valid input"
      end
      check_for_win
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

  def check_for_win
    if check_colums || check_rows
      print_matrix
      p "Winner"
    end
  end

  def check_colums
    m = @matrix
    col_A = [m[0][0], m[1][0], m[2][0],m[3][0],m[4][0], m[5][0]].join
    col_B = [m[0][0], m[1][0], m[2][0],m[3][0],m[4][0], m[5][0]].join
    col_C = [m[0][0], m[1][0], m[2][0],m[3][0],m[4][0], m[5][0]].join
    col_D = [m[0][0], m[1][0], m[2][0],m[3][0],m[4][0], m[5][0]].join
    col_E = [m[0][0], m[1][0], m[2][0],m[3][0],m[4][0], m[5][0]].join
    col_F = [m[0][0], m[1][0], m[2][0],m[3][0],m[4][0], m[5][0]].join
    col_G = [m[0][0], m[1][0], m[2][0],m[3][0],m[4][0], m[5][0]].join
    if (col_A || col_B || col_C || col_D || col_E || col_F || col_G).include?("XXXX" || "OOOO") 
     true
    end

  end

  def check_rows

  end


end





                  
                  