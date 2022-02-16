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
    if verify_move?(move,row:row,column:column)
        @grid[row][column] = move
        return @grid
    else 
         return @grid
    end
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

    def verify_win_by_row?
        @grid.each { |row|
            if row.uniq.length == 1
                if row[0] != ""
                    return true
                    break
                end
            end
        }
        return false
    end

    def verify_win_by_column?
        for i in 0..2
            column = [
                @grid[0][i], @grid[1][i], @grid[2][i]
            ]
            if column.uniq.length == 1
                if column[0] != ""
                    return true
                    break
                end
            end
        end
        return false
    end

    def verify_win_by_LR_diagonal?
        right_diagonal = [@grid[0][0], @grid[1][1], @grid[2][2]]
        left_diagonal = [@grid[0][2], @grid[1][1], @grid[2][0]]
        if right_diagonal.uniq.length == 1 || left_diagonal.uniq.length == 1
            if @grid[1][1] != ""
            return true
            end
        end
     false
    end




 end
 