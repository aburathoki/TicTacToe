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

    def minimax(grid, player_to_play)


        result = check_grid_for_terminal(grid, player_to_play)

        if result != nil
            return result
        else 
            available_moves = get_available_moves(grid)

            moves = [] # an array of those hashes [{co-ord, score}]

            puts "********** initial grid #{grid}"

            puts "********** available options #{available_moves}"

            

            available_moves.each_with_index do |move, index|
                # we're creating a hash {co-ord, score}
                move_hash = {}
                move_hash[:coord] = move

                puts "********** initial grid before making hypothetical move #{grid} #{index}"

                # make move in the avilable move spot (probably need to make a new class of TicTacToe)
                    # declare class of tictactoe
                    # run play_move method to change board
                new_grid = make_hypothetical_move(grid, move,player_to_play)
                
                # get new grid and run minimax function again, and set it to the result (this is where it's getting recursive!)
                    # run minimax again and set it to variable claled result
                    # add item to dictionary: move_dict["score"] = result
                # minimax_result = minimax(new_grid,!player_to_play)

                # move_hash[:result] = minimax_result

                # puts "****** #{index}"
                # puts "******** #{new_grid} #{move_hash}"

                moves << move_hash
                # add dictionary to array of moves
            end

            # do the best mvoe stuff

            # return best move
            nil 
        end
    end
    
    def make_hypothetical_move(grid_waiting_for_move,move,player_to_play)
        tictactoe = TicTacToe.new(grid_waiting_for_move,player_to_play)
    
        tictactoe.play_move(row:move[0],column: move[1])

        # puts "******** #{tictactoe.grid}"
        
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
