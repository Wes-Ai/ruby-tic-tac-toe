# Outline of game:
# Board game object
# Function to check if won
# Function to take human input

class TicTacToe
    @winner
    @loser
    @board = []
    def initialize(player1, player2)
    end

    def play_round

    end

    def
end

module PrintDisplay
    def display_intro_message
        puts "Welcome to Tic-Tac-Toe!"
    end

    def display_player_x_name
        puts "Please enter the name of the first player (X): "
    end

    def display_player_o_name
        puts "Please enter the name of the second player (O): "
    end

    def display_winner_message(name)
        puts "Congratulations! #{name} is the winner!"
    end
end


test_game = TicTacToe.new("Wes", "Riley")

test_game.play