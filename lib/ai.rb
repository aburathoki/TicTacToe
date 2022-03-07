require_relative  '../lib/move'

class AI

    attr_accessor :grid, :tictactoe

    def initialize(grid)
        @grid = grid
    end 

    def minimax(grid, player_to_play, level)
        result = check_grid_for_terminal(grid, player_to_play)

        if result != nil
            result_hash = {}
            result_hash[:result] = result
            result_hash[:level] = level
            return result_hash
        else 
            available_moves = get_available_moves(grid)
            moves = []

            available_moves.each_with_index do |move, index|
                move_hash = {}
                move_hash[:coord] = move

                new_grid = make_hypothetical_move(grid, move,player_to_play)
                
                new_level = level + 1

                move_hash[:result] = minimax(new_grid,!player_to_play, new_level)[:result]
                move_hash[:level] = minimax(new_grid,!player_to_play, new_level)[:level]

                moves << move_hash
            end
            ranks_available_moves(moves, player_to_play)
        end

    end


    def check_grid_for_terminal(grid,player_to_play) 
        verify = Verify.new(grid)

        if verify.verify_win? 
            return player_to_play ? 10 : -10
        elsif verify.verify_draw?
            return 0
        else
            return nil
        end

    end

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
    
    def make_hypothetical_move(grid,move,player_to_play)
        cloned_grid = grid.collect(&:dup)
        
        tictactoe = Move.new(cloned_grid,player_to_play)
    
        tictactoe.play_move(row:move[0],column: move[1])
    end 

    def ranks_available_moves(moves, player_to_play)
        if player_to_play
            best_hash = moves.min_by { |move|
                move[:result]
            }    
        else
            best_hash = moves.max_by { |move|
                move[:result]
            }
        end
        best_result = best_hash[:result]
        array_of_best_moves = moves.select {|move| move[:result] == best_result }
        if player_to_play 
            if best_result < 0 
                fastest_move = array_of_best_moves.min_by { |move| move[:level]}
            else
                fastest_move = array_of_best_moves.max_by { |move| move[:level]}
            end
        else 
            if best_result > 0
                fastest_move = array_of_best_moves.min_by { |move| move[:level]}
            else
                fastest_move = array_of_best_moves.max_by { |move| move[:level]}
            end
        end
        array_of_best_moves.select{|move| move[:level] == fastest_move[:level] }.shuffle.first
    end
    
end