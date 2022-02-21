require_relative  '../lib/tictactoe'

class AI

    attr_accessor :grid, :tictactoe

    def initialize(grid)
        @grid = grid
        @tictactoe = TicTacToe.new(grid, false)
    end 

    def make_move(grid)

    end

    def get_available_moves
        available_moves =[]
        for i in 0..2 
            for x in 0..2 
                if @grid[i][x] == ""
                available_moves.append([i, x])  
                end
            end
        end 
        return available_moves
    end


    def rank_moves(available_moves)
        move_scores = []

        available_moves.each do |move|
            row = move[0]
            column = move[1]

            move_result = @tictactoe.attempt_move(row: row, column: column)
            
            puts "********* #{move_result}"

            if move_result == :ai_win
                move_scores.append(1)
            else
                move_scores.append(0)
            end

        end

        return move_scores
    end 

end
