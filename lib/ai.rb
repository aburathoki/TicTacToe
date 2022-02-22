require_relative  '../lib/tictactoe'

class AI

    attr_accessor :grid, :tictactoe

    def initialize(grid)
        @grid = grid
        # @tictactoe = TicTacToe.new(grid, false)
    end 


    # 1

    def check_grid_for_terminal(grid,player_to_play) 
        tictactoe = TicTacToe.new(grid,player_to_play)

        if tictactoe.verify_win? 
            return player_to_play ? 10 : -10
        elsif tictactoe.verify_draw?
            return 0
        else
            return nil
        end

    end

    # 2

    def get_available_moves(grid)
        available_moves =[]

        for i in 0..2 
            for x in 0..2 
                if grid[i][x] == ""
                    available_moves.append([i, x])  
                end
            end
        end 
        return available_moves
    end

    # 3

    def minimax(grid, player_to_play)

        available_moves = get_available_moves(grid)

        result = check_grid_for_terminal(grid, player_to_play)

        if result != nil
            return result
        else 

            moves = []

            for available_moves.each do |move|

            end

        end
    end



    # def rank_moves(grid)
    #     move_scores = []
    #     available_moves = get_available_moves(grid)

    #     available_moves.each do |move|
    #         tictactoe = TicTacToe.new(grid, false)
    #         row = move[0]
    #         column = move[1]

    #         move_result = tictactoe.attempt_move(row: row, column: column)
            
    #         if move_result == :ai_win
    #             move_scores.append(10)
    #         elsif move_result == :player_win
    #             move_scores.append(-10)
    #         elsif move_result == :draw
    #             move_scores.append(0)
    #         else 
    #             move_scores.append(0)
    #         end

    #     end

    #     return move_scores
    # end 
    
   

end
