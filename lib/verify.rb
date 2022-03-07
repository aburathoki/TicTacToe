class Verify

    attr_accessor :grid
    def initialize(grid)
        @grid = grid
    end

    def verify_win?
        return verify_win_by_row? || verify_win_by_column? || verify_win_by_LR_diagonal?
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

    def verify_draw?
        has_move_to_play = @grid.flatten.include? "" 
        return !has_move_to_play
    end

end