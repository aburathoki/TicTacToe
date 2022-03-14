require_relative  '../../lib/model/move'
require_relative  '../../lib/model/verify'

class AI
  
    def initialize(grid)
        @grid = grid
    end 

    def minimax(grid, player_to_play, level)
        result = check_grid_for_terminal(grid, player_to_play)

        if result != nil
            {:result => result, :level => level}
        else 
            available_moves = get_available_moves(grid)
            moves = []

            available_moves.each do |move|
                move_hash = {:coord => move}
               
                new_grid = make_hypothetical_move(grid, move,player_to_play)
                
                minimax_result = minimax(new_grid,!player_to_play, level + 1)

                move_hash[:result] = minimax_result[:result]
                move_hash[:level] = minimax_result[:level]

                moves << move_hash
            end
            ranks_available_moves(moves, player_to_play)
        end

    end

    def check_grid_for_terminal(grid,player_to_play) 
        verify = Verify.new(grid)

        if verify.verify_win? 
            player_to_play ? 10 : -10
        elsif verify.verify_draw?
            0
        end
    end

    def get_available_moves(grid)
        available_moves =[]

        grid.each_with_index do |row, i|
            row.each_with_index do |cell, j|
                if grid[i][j] == ""
                    available_moves.append([i, j])  
                end
            end
        end 
        available_moves
    end
    
    def make_hypothetical_move(grid,move,player_to_play)
        cloned_grid = grid.collect(&:dup)
        
        tictactoe_move = Move.new(cloned_grid,player_to_play)
    
        tictactoe_move.play_move(row:move[0],column: move[1])
    end 

    def ranks_available_moves(moves, player_to_play)
        best_result = get_best_result(moves, player_to_play)
        best_moves = moves.select {|move| move[:result] == best_result }
        fastest_move = get_best_level(best_moves,player_to_play,best_result)
        best_moves.select{|move| move[:level] == fastest_move }.shuffle.first
    end
    
    def get_best_result(moves, player_to_play) 
        if player_to_play
            best_hash = moves.min_by { |move|
                move[:result]
            }    
        else
            best_hash = moves.max_by { |move|
                move[:result]
            }
        end
        best_hash[:result]
    end

    def get_best_level(moves,player_to_play,best_result)
        if player_to_play == best_result < 0
            fastest_move = moves.min_by { |move| move[:level]}[:level] 
        else 
            fastest_move = moves.max_by { |move| move[:level]}[:level]
        end
    end
end