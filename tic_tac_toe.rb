# Outline of game:
# Board game object
# Function to check if won
# Function to take human input
# [0, X, 2, 3, X, 5, O, X, 8, 9]

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

  def double_spacer
    puts
    puts
  end

  def display_victory_banner(name)
    puts "***---***---***---***---***---***---***---***---***---***---***---***"
    puts "***                                                               ***"
    puts "            Congratulations! #{name} is the winner!"
    puts "***                                                               ***"
    puts "***---***---***---***---***---***---***---***---***---***---***---***"
  end

  def display_input_position_error
    puts 'That position is already taken, please try again.'
  end

  def display_input_type_error
    puts 'That input is not valid, please try again.'
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
    @winning_combos = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7],
                       [2, 5, 8], [3, 6, 9], [1, 5, 9], [3, 5, 7]]
  end

  def begin_game
    display_intro
    assign_players
    play_game
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

  def play_game
    round_determiner
    play_round while @game_on
  end

  def play_round
    double_spacer
    ask_where_to_play(@current_player)
    pretty_print_board(@board)
    update_board(validate_user_input, @current_symbol)
    round_determiner
  end

  def validate_user_input
    input = input_from_user.to_i
    if input.eql? 0
      display_input_type_error
      validate_user_input
    elsif @board[input].is_a? String
      display_input_position_error
      validate_user_input
    else
      input
    end
  end

  def update_board(update_index, current_symbol)
    @board[update_index] = current_symbol
  end

  def check_winner
    @winning_combos.each do |combo|
      sliced_board = [@board.slice(combo[0]), @board.slice(combo[1]), @board.slice(combo[2])]
      return true if all_equal?(sliced_board)
    end
    false
  end

  def all_equal?(arr)
    arr.uniq.size <= 1
  end

  def game_winner
    display_victory_banner(@current_player)
    pretty_print_board(@board)
    display_victory_banner(@current_player)
    @game_on = false
  end

  def round_determiner
    if check_winner
      game_winner
    elsif @count >= 9
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
end

continue_playing = true

while continue_playing
  game = TicTacToe.new
  game.begin_game
  puts 'Would you like to play another game? (Y/N)'
  answer = gets.chomp.upcase

  continue_playing = false unless answer == 'Y'
end
