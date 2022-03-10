require_relative '../../lib/model/verify'

class Move

    def initialize(grid, player_to_play)
      @grid = grid
      @player_to_play = player_to_play
    end
    
    def attempt_move(row:, column:)
        if verify_move?(row: row, column: column)
            play_move(row: row, column: column)

            verify = Verify.new(@grid)

            if verify.verify_win?
                return @player_to_play ? :player_win : :ai_win
            elsif verify.verify_draw?
                return :draw
            else 
                return :next_move
            end 
        else 
            return :illegal_move
        end
    end

    def verify_move?(row:, column:)
        @grid[row][column] == ""
    end 

    def play_move(row:, column:)
        if @player_to_play
            player_move(row: row, column: column)
        else 
            computer_move(row: row, column: column)
        end
    end

    def player_move(row:, column:)
        addMove("X",row: row, column: column)
    end

    def computer_move(row:, column:)
        addMove("O", row: row, column: column)
    end

    def addMove(move,row:, column:)
        @grid[row][column] = move
        return @grid
    end
end
