# Outline of game:
# Board game object
# Function to check if won
# Function to take human input

module PrintDisplay
  def display_intro
    puts 'Welcome to Tic-Tac-Toe!'
  end

  def display_name_question(number)
    puts "Please enter the name of the #{number} player: "
  end

  def display_symbol_question
    puts 'What would you like your symbol to be? (X / O)'
  end

  def display_player_o_name
    puts 'Please enter the name of the second player (O): '
  end

  def display_winner(name)
    puts "Congratulations! #{name} is the winner!"
  end

  def display_game_over
    puts 'Game over! It\'s a draw!'
  end

  def ask_where_to_play(name)
    puts "#{name}, where would you like to play? (1-9)"
  end

  def pretty_print_board(board_array)
    spacer
    puts "     #{board_array[1]} | #{board_array[2]} | #{board_array[3]}"
    puts '    ---|---|---'
    puts "     #{board_array[4]} | #{board_array[5]} | #{board_array[6]}"
    puts '    ---|---|---'
    puts "     #{board_array[7]} | #{board_array[8]} | #{board_array[9]}"
    spacer
  end

  def spacer
    puts
  end
end

module Gameplay
  def input_from_user
    gets.chomp
  end
end

class TicTacToe
  include PrintDisplay
  include Gameplay
  
  def initialize
    @board = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
    @count = 0
    @current_player = nil
    @game_on = true
    @player1 = nil
    @player2 = nil
    @player1_symbol = nil
    @player2_symbol = nil
    @winning_combos = [[0, 1, 2], [0, 4, 8], [0, 3, 6], [3, 4, 5],
                      [6, 7, 8], [1, 4, 7], [2, 5, 8], [6, 4, 2]]
  end

  def begin_game
    display_intro
    assign_players
    play_round()
  end

  def assign_players
    display_name_question('first')
    @player1 = input_from_user
    display_symbol_question
    @player1_symbol = input_from_user.upcase
    display_name_question('second')
    @player2 = input_from_user
    display_symbol_question
    @player2_symbol = input_from_user.upcase
  end

  def play_round
    round_determiner
    while @game_on
      ask_where_to_play(@current_player)
      pretty_print_board(@board)
      update_board(input_from_user.to_i, @current_symbol)
      round_determiner
    end
  end

  def update_board(update_index, current_symbol)
    @board[update_index] = current_symbol
  end

  #def check_game_win
   # if(current_board)

  def round_determiner
    if @count >= 9
      game_over
    elsif @count.odd?
      @current_player = @player1
      @current_symbol = @player1_symbol
    else
      @current_player = @player2
      @current_symbol = @player2_symbol
    end
    @count += 1
  end

  def game_over
    display_game_over
    @game_on = false
  end

  def test
    input_from_user
    pretty_print_board([1, 'O', 3, 4, 'X', 6, 7, 8, 9])
  end
end

test_game = TicTacToe.new()

test_game.begin_game
