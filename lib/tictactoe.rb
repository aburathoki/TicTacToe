 class TicTacToe
    @grid

    def initialize
    @grid = [
        ["","",""],
        ["","",""],
        ["","",""]
    ] 
    end
    def return_current_grid
        return @grid
    end

    def addMove(move,row:, column:)
        @grid[row][column] = move
        return @grid
    end

 end