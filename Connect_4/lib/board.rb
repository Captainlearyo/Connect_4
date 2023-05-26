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

  end

  def check_colums
    
  end

  def check_rows
    
  end


end





                  
                  