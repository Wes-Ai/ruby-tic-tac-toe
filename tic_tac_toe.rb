#print board
class PrintBoard
    def initialize(board)
        @board = board
    end

    def print
        puts @board[0] + "|" + @board[1] + "|" + @board[2]
        puts @board[3] + "|" + @board[4] + "|" + @board[5]
        puts @board[6] + "|" + @board[7] + "|" + @board[8]
    end
end
#format board (array)

#get user input

#game array

#game logic

#game loop

#CPU player logic

game1 = PrintBoard.new(["X", "X", "X", "X", "X", "X", "X", "X", "X"])
game1.print