class TicTacToe

  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6],
]

def display_board
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end

def input_to_index(user_input)
  user_input.to_i - 1
end

def move(index, token)
  @board[index] = token
end

def position_taken?(index)
  !(@board[index].nil? || @board[index] == " ")
end

def valid_move?(index)
  index.between?(0,8) && !position_taken?(index)
end

def current_player
  counter = turn_count
  counter.even? ? "X" : "O"
end

def turn_count
  @board.count {|token| token == "X" || token == "O" }
end

def turn
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if !valid_move?(index)
    turn
  else move(index, current_player)
  display_board
 end
end

def won?
  WIN_COMBINATIONS.each do |combo|
  win_in_0 = combo[0]
  win_in_1 = combo[1]
  win_in_2 = combo[2]

  position_1 = @board[win_in_0] # load the value of the board at win_index_1
  position_2 = @board[win_in_1] # load the value of the board at win_index_2
  position_3 = @board[win_in_2]

  if position_1 == "X" && position_2 == "X" && position_3 == "X" || position_1 == "O" && position_2 == "O" && position_3 == "O"
    return combo
   end
 end
  return false
 end

def full?
   @board.all? { |item| item != " "}
end

def draw?
  !won? && full?
end

def over?
 won? || draw?
end

def winner
  if won?
    @board[won?[0]]
  end
end

  end
end

def play
  while !over?
  turn
  end
  if won?
     puts "Congratulations #{winner}!"
  end
  if draw?
     puts "Cat's Game!"
  end
 end

 end
