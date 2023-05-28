module Insertable
  def insert_x(column)
    if @columns.include?(column) && @bases[column][0] > -1
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
    if @columns.include?(column) && @bases[column][0] > -1
      @matrix[@bases[column][0]][@bases[column][1]]  = "O"
      @bases[column][0] -= 1
      else
        p "Please enter valid input"
      end
      check_for_win
      check_for_tie
      print_matrix
  end
end