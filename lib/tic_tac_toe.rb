class TicTacToe

WIN_COMBINATIONS = [ 
[0,1,2], 
[3,4,5], 
[6,7,8], 
[0,3,6], 
[1,4,7], 
[2,5,8], 
[0,4,8], 
[2,4,6] ]

  def initialize()
    @board = [" "," "," "," "," "," "," "," "," "]
  end
  
  def display_board()
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(user_input)
    user_input.to_i - 1
  end
  
  def move(index, player_token)
    @board[index] = player_token
  end

  def position_taken?(index)
   !(@board[index].nil? || @board[index] == " ")
  end
  
  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end
  
  def turn()
    puts "Please enter 1-9:"
    user_input = gets.strip
    index = input_to_index(user_input)
      if valid_move?(index)
        player_token = current_player()
        move(index, player_token)
        display_board()
      else
        turn()
      end
  end
  
  def turn_count() 
    move_count = 0
    @board.each do |position|
      if position == "X" || position == "O"
        move_count += 1
      end
     end
    return move_count
  end
  
  
  def current_player()
    move_count = turn_count()
    if move_count % 2 == 0
      "X"
    else
      "O"
    end
  end
  
  
  def won?()
win_combo_length = WIN_COMBINATIONS.length - 1
	for a in 0..win_combo_length
	win_combo= WIN_COMBINATIONS[a]
	check_board = []
		for i in 0..2
		check_board.push(@board[win_combo[i]])
		i += 1
		end
			if check_board.all? { |elements| elements == "X"}
				return win_combo
			elsif check_board.all? { |elements| elements == "O"}
				return win_combo 
			end
			a += 1
	end
	if @board.any? { |elements| elements != " "}
  else
    return false
	end
end
  
  def full?()
    if @board.any? { |markers| markers == " "}
      return false
    else 
      return true
  end
end
  
  def draw?(board)
  if won?(board).kind_of?(Array) == false && full?(board) == true
    return true
  else
    return false
  end
end
  
end