module Insertable
  def insert_x(column)
    if valid_column?(column)
    @matrix[@bases[column][0]][@bases[column][1]]  = "X"
    @bases[column][0] -= 1
    else
      p "Please enter valid input"
    end
    check_for_win
    check_for_tie
    print_matrix
  end

  def insert_o(column)
    if valid_column?(column)
      @matrix[@bases[column][0]][@bases[column][1]]  = "O"
      @bases[column][0] -= 1
      else
        p "Please enter valid input"
      end
      check_for_win
      check_for_tie
      print_matrix
  end

  def valid_column?(column)
    @columns.include?(column) && @bases[column][0] > -1 ? true : false
  end
end