

class ComputerPlayer
  def initialize

    @index_chart = {
      0 => 'A',
      1 => 'B',
      2 => 'C',
      3 => 'D',
      4 => 'E',
      5 => 'F',
      6 => 'G'
    }
  end


  
  

  def logic(board)
    if logic_check_rows(board)
      return  board.insert_o(logic_check_rows(board))
    elsif logic_check_columns(board)
      return  board.insert_o(logic_check_columns(board))
    elsif logic_check_rows_add_o(board)
      return  board.insert_o(logic_check_rows_add_o(board))
    elsif logic_check_columns_add_o(board)
      return  board.insert_o(logic_check_columns_add_o(board))
    else
      return random_move(board)
    end
  end

  def random_move(board)
    columns = ["A", "B", "C", "D", "E", "F", "G"]
    column = columns.sample
    if board.insert_o(column)
      true
    else
      random_move(board)
    end
  end


  # def random_move(board)
  #   columns = ["A", "B", "C", "D", "E", "F", "G"]
  #   column = columns.sample 
  #   if board.valid_column?(column)
  #     return column
  #   end
  # end

  def logic_check_rows(board)
    m = board.matrix
    m.each do |row| 
      row.each_with_index do |val, i|
        prev = row[i - 1]
        nex = row[i + 1]
          #p [prev, val, nex]     
          if  prev == "." && val == "X" && nex == "X" && i > 0
            #p ".....XX"
            return  @index_chart[i - 1]
          elsif prev == "X" && val == "X" && nex == "."
            #p "XX...."
            return  @index_chart[i + 1]
          end
      end 
    end 
    return false
  end

  def logic_check_columns(board)
    m = board.matrix
    col_A = [m[0][0], m[1][0], m[2][0],m[3][0],m[4][0], m[5][0]].join
    col_B = [m[0][1], m[1][1], m[2][1],m[3][1],m[4][1], m[5][1]].join
    col_C = [m[0][2], m[1][2], m[2][2],m[3][2],m[4][2], m[5][2]].join
    col_D = [m[0][3], m[1][3], m[2][3],m[3][3],m[4][3], m[5][3]].join
    col_E = [m[0][4], m[1][4], m[2][4],m[3][4],m[4][4], m[5][4]].join
    col_F = [m[0][5], m[1][5], m[2][5],m[3][5],m[4][5], m[5][5]].join
    col_G = [m[0][6], m[1][6], m[2][6],m[3][6],m[4][6], m[5][6]].join  
    col_matrix = [col_A, col_B, col_C, col_D, col_E, col_F, col_G]

    col_matrix.each_with_index do |col, i|
       col 
      if col.include?(".XX")
         @index_chart[i]
       return @index_chart[i]
      
      end
    end
    return false 
  end

  def logic_check_diagonal_1(board)
    m = board.matrix
    diag_1 = [m[3][0], m[2][1], m[1][2],m[0][3]]
    diag_2 = [m[4][0], m[3][1], m[2][2],m[1][3],m[0][4]]
    diag_3 = [m[5][0], m[4][1], m[3][2],m[2][3],m[1][4], m[0][5]]
    diag_4 = [m[5][1], m[4][2], m[3][3],m[2][4],m[1][5], m[0][6]]
    diag_5 = [m[5][2], m[4][3], m[3][4],m[2][5], m[1][6]] 
    diag_6 = [m[5][3], m[4][4], m[3][5],m[2][6]]
    diag_arr = [diag_1, diag_2, diag_3, diag_4, diag_5, diag_6]

    diag_arr.each do |diag|
      diag.each_with_index do |val ,i|
        prev = diag[i - 1]
        nex = diag[i + 1]
        #p [prev, val, nex]
       if prev == "X" && val == "X" && nex == "."
          #p "XX...."
          return  @index_chart[i + 1]
        end

      end
    end
 
  end

  def logic_check_diagonal_2(board)
    m = board.matrix
    
    diag_7 = [m[0][3], m[1][4], m[2][5],m[3][6]]
    diag_8 = [m[0][2], m[1][3], m[2][4],m[3][5], m[4][6]]
    diag_9 = [m[0][0], m[1][1], m[2][2],m[3][3], m[4][4], m[5][5]]
    diag_10 = [m[0][1], m[1][2], m[2][3],m[3][4],m[4][5], m[5][6]]
    diag_11 = [m[1][0], m[2][1], m[3][2],m[4][3],m[5][4]]
    diag_12 = [m[2][0], m[3][1], m[4][2],m[5][3]]

    diag_arr =[diag_7, diag_8, diag_9, diag_10, diag_11, diag_12]

    diag_arr.each do |diag|
      diag.each_with_index do |val ,i|
        prev = diag[i - 1]
        nex = diag[i + 1]
        #p [prev, val, nex]
       if prev == "X" && val == "X" && nex == "."
          #p "XX...."
          return  @index_chart[i + 1]
        end

      end
    end

  end

  def logic_check_rows_add_o(board)
    m = board.matrix
    m.each do |row| 
      row.each_with_index do |val, i|
        prev = row[i - 1]
        nex = row[i + 1]
          #p [prev, val, nex]     
          if  prev == "." && val == "O" && nex == "O" && i > 0
            return  @index_chart[i - 1]
          elsif prev == "O" && val == "O" && nex == "."
            return  @index_chart[i + 1]
          end
      end 
    end 
    return false
  end

  def logic_check_columns_add_o(board)
    m = board.matrix
    col_A = [m[0][0], m[1][0], m[2][0],m[3][0],m[4][0], m[5][0]].join
    col_B = [m[0][1], m[1][1], m[2][1],m[3][1],m[4][1], m[5][1]].join
    col_C = [m[0][2], m[1][2], m[2][2],m[3][2],m[4][2], m[5][2]].join
    col_D = [m[0][3], m[1][3], m[2][3],m[3][3],m[4][3], m[5][3]].join
    col_E = [m[0][4], m[1][4], m[2][4],m[3][4],m[4][4], m[5][4]].join
    col_F = [m[0][5], m[1][5], m[2][5],m[3][5],m[4][5], m[5][5]].join
    col_G = [m[0][6], m[1][6], m[2][6],m[3][6],m[4][6], m[5][6]].join  
    col_matrix = [col_A, col_B, col_C, col_D, col_E, col_F, col_G]

    col_matrix.each_with_index do |col, i|
       col 
      if col.include?(".OO")
         @index_chart[i]
       return @index_chart[i]
      
      end
    end
    return false 
  end



end