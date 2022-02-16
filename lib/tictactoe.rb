 class TicTacToe

    attr_accessor :grid
    def initialize(grid = [
        ["","",""],
        ["","",""],
        ["","",""]
    ])
      @grid = grid
    end
    
    def return_current_grid
        return @grid
    end

    def addMove(move,row:, column:)
        @grid[row][column] = move
        return @grid
    end

    def changeGrid(newGrid)
        @grid = newGrid
    end

    def verify_move? (move,row:, column:)
        if @grid[row][column] == ""
            return true
        else 
            return false
        end
    end

 end
 