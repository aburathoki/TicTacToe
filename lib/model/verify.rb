class Verify

    def initialize(grid)
        @grid = grid
    end

    def verify_win?
        return verify_win_by_row? || verify_win_by_column? || verify_win_by_LR_diagonal?
    end

    def verify_win_by_row?
        verify_win_in_a_line?(@grid)
    end

    def verify_win_by_column?
        verify_win_in_a_line?(@grid.transpose)
    end

    def verify_win_in_a_line?(grid)
        grid.each { |row|
            if row.uniq.length == 1
                if row[0] != ""
                    return true
                    break  
                end
            end
        }
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