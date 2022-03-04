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


    # https://www.freecodecamp.org/news/how-to-make-your-tic-tac-toe-game-unbeatable-by-using-the-minimax-algorithm-9d690bad4b37/

    def minimax(grid, player_to_play, level)


        result = check_grid_for_terminal(grid, player_to_play)

        if result != nil
            result_hash = {}
            result_hash[:result] = result
            return result_hash
        else 
            available_moves = get_available_moves(grid)

            moves = [] # an array of those hashes [{co-ord, score}]

            available_moves.each_with_index do |move, index|
                move_hash = {} # we're creating a hash {co-ord, score}
                move_hash[:coord] = move

                # make move in the avilable move spot (probably need to make a new class of TicTacToe
                new_grid = make_hypothetical_move(grid, move,player_to_play)
                
                # get new grid and run minimax function again, and set it to the result (this is where it's getting recursive!)
                new_level = level + 1
                minimax_result = minimax(new_grid,!player_to_play, new_level)[:result]

                move_hash[:result] = minimax_result
                moves << move_hash
            end
            puts "********** Level ***** #{level} #{player_to_play ? "Player" : "AI"}"
            puts "********* MOVES ****** #{moves}"
            
            moves[0]
        end

    end
    
    def make_hypothetical_move(grid,move,player_to_play)
        cloned_grid = grid.collect(&:dup)
        
        tictactoe = TicTacToe.new(cloned_grid,player_to_play)
    
        final_grid = tictactoe.play_move(row:move[0],column: move[1])

        return final_grid
    end 

    def ranks_available_moves(moves, player_to_play)
        if player_to_play
            
        else
            moves.max_by { |move|
                move[:result]
            }
        end
    end
    
end