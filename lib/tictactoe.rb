 class TicTacToe

    attr_accessor :grid, :player_to_play
    def initialize(grid = [
        ["","",""],
        ["","",""],
        ["","",""]
    ])
      @grid = grid
      @player_to_play = true
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

    def verify_move?(row:, column:)
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

  def verify_draw?
    has_move_to_play = @grid.flatten.include? "" 
    return !has_move_to_play
  end

  def verify_win?
    return verify_win_by_row? || verify_win_by_column? || verify_win_by_LR_diagonal?
  end

  def player_move(row:, column:)
    addMove("X",row: row, column: column)
  end

  def computer_move(row:, column:)
    addMove("O", row: row, column: column)
  end
  
  def play_move(row:, column:)
    if @player_to_play
        player_move(row: row, column: column)
    else 
        computer_move(row: row, column: column)
    end
end

    def attempt_move(row:, column:)
        if verify_move?(row: row, column: column)
            play_move(row: row, column: column)
            if verify_win?
                # puts "#{@player_to_play ? "player" : "AI"} wins!"
                return @player_to_play ? :player_win : :ai_win
            elsif verify_draw?
                return :draw
            else 
                @player_to_play = !@player_to_play
                return :next_move
            end 
        else 
            return :illegal_move
        end
    end
    
end
