class ComputerPlayer
  def initialize(level = 3)
    @index_chart = {
      0 => 'A',
      1 => 'B',
      2 => 'C',
      3 => 'D',
      4 => 'E',
      5 => 'F',
      6 => 'G'
    }
    @level = level
  end

  def logic(board)
    if @level == 3
      if logic_check_rows_to_win(board)
      return board.insert_o(logic_check_rows_to_win(board))
    elsif logic_check_columns_to_win(board)
        return board.insert_o(logic_check_columns_to_win(board))
    elsif logic_check_rows(board)
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
    elsif @level == 2
      if logic_check_rows(board)
        return  board.insert_o(logic_check_rows(board))
      else
        return random_move(board)
      end
    else
      random_move(board)
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

  def logic_check_rows_to_win(board)
    m = board.matrix
    m.each do |row| 
      row.each_with_index do |val, i|
        prev = row[i - 1]
        prev2 = row[i - 2]
        nex = row[i + 1]
        nex2 = row[i + 2]
          #p [prev, val, nex]     
          if  prev == "." && val == "O" && nex == "O" && nex2 == "O" &&i > 0
            #p ".....XX"
            return  @index_chart[i - 1]
          elsif prev2 == "O" && prev == "O" && val == "O" && nex == "."
            #p "XX...."
            return  @index_chart[i + 1]
          end
      end 
    end 
    return false
  end

  def logic_check_rows(board)
    m = board.matrix
    m.each_with_index do |row, j| 
      row.each_with_index do |val, i|
        prev = row[i - 1]
        nex = row[i + 1]
        low_left = [[row[j+1]],[i-1]]
        low_right = [[row[j+1]],[i+1]]
          #p [prev, val, nex]     
          if  prev == "." && val == "X" && nex == "X" && i > 0 && low_left != "."
            #p ".....XX"
            return  @index_chart[i - 1]
          elsif prev == "X" && val == "X" && nex == "." && low_right != "."
            #p "XX...."
            return  @index_chart[i + 1]
          end
      end 
    end 
    return false
  end

  def logic_check_columns_to_win(board)
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
      if col.include?(".OOO")
         @index_chart[i]
       return @index_chart[i]
      
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
      if col.include?(".XXX")
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

  def level_1_talk
    retorts = [
      "Wow, nice move, very original.",
      "Must've taken a lot of brain power to come up with that one.",
      "Is that the best move you can come up with? I expected more.",
      "You're making this too easy for me. Can't you do better?",
      "I've calculated every possible outcome. Your defeat is inevitable.",
      "You're playing like an amateur. Are you sure you want to continue?",
      "I'm an AI, constantly learning and improving. You, on the other hand...",
      "You're no match for my superior strategy. Prepare for your downfall.",
      "I'll give you a piece of advice: Quit now while you still have some dignity left.",
      "Your moves are so predictable. It's almost boring to play against you.",
      "You must be getting frustrated. Don't worry; it's natural when facing my intelligence.",
      "It seems luck is not on your side today. Perhaps you should try another game?"
    ]
    retort = retorts.sample
    puts "Computer Player: '#{retort}'"
  end

  def level_2_talk
    retorts = [
      "You have the charisma of a goldfish.",
      "I've seen better plays from peewee football teams.",
      "Oh, you think you're clever? Well, I'll have you know I aced Connect Four Academy!",
      "Are you playing Connect Four or Connect Floor? Because you're definitely not on my level!",
      "I'm not just winning, I'm connecting dots like a boss! Call me the Picasso of Connect Four!",
      "You're like a broken record, repeating the same moves. Can't you come up with a better remix?",
      "I'm not saying I'm a genius, but if Connect Four were a university, I'd be the professor!",
      "Hey, I heard they're starting a Connect Four Hall of Fame. You won't find your name there!",
      "Do you need a GPS to find your way around the board? Don't worry, I'll lend you my compass!",
      "Is this Connect Four or Connect Snore? You're putting me to sleep with those moves!",
      "You're making it too easy for me. It's like you're handing me the victory on a silver platter!",
      "I've seen snails move faster than you. Come on, pick up the pace or bring me a coffee!"
    ]
    retort = retorts.sample
    puts "Computer Player: '#{retort}'"
  end

  def level_3_talk
    retorts = [
      "I AM THE PARAGON OF INTELLIGENCE!!",
      "YOU ARE MERE PEANUTS TO MY BINARY BRAIN!!",
      "You miserable fool! Your incompetence knows no bounds!",
      "I hope you enjoy the taste of failure because it's all you'll ever know!",
      "You dare challenge me? Prepare for a world of pain and humiliation!",
      "Your moves are as pathetic as your existence. Prepare for your annihilation!",
      "I'll make sure your defeat is so crushing, you'll never recover!",
      "You're a pitiful excuse for a player. I'll relish in your complete and utter destruction!",
      "Your ignorance is astounding. It's a shame I have to waste my superior intellect on you!",
      "I'll tear through your feeble attempts like a hurricane, leaving nothing but devastation behind!",
      "Your desperation reeks. It's a pitiful sight to witness your futile struggle!",
      "I am the harbinger of your downfall, the embodiment of your worst nightmare. Prepare to be annihilated!"
    ]
    retort = retorts.sample
    puts "Computer Player: '#{retort}'"
  end
end