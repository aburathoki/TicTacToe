require_relative '../lib/model/move'

describe Move do

    context "Testing add move method" do
        it "adds first move to grid" do 
            start_test_grid = [
                ["","",""],
                ["","",""],
                ["","",""]
            ]
            move_class = Move.new(start_test_grid, true)
            exepected_grid_after_first_move = [
                ["X","",""],
                ["","",""],
                ["","",""]
            ]
            
            grid_after_first_move = move_class.addMove("X", row: 0, column: 0)
        
            expect(grid_after_first_move).to eq(exepected_grid_after_first_move)
        end
    
        it "adds alternative move to grid " do
            start_test_grid = [
                ["","",""],
                ["","",""],
                ["","",""]
            ]
            move_class = Move.new(start_test_grid, true)
    
            exepected_grid_after_first_move = [
                ["","O",""],
                ["","",""],
                ["","",""]
            ]
            grid_after_second_move = move_class.addMove("O", row: 0, column: 1)
    
            expect(grid_after_second_move).to eq(exepected_grid_after_first_move)
        end
    
        it "adds player move to grid" do
        
           start_test_grid = ([
                ["X","",""],
                ["","",""],
                ["","",""]
            ])
            move_class = Move.new(start_test_grid, false)
            expected_grid_after_second_move = [
                ["X","",""],
                ["","",""],
                ["","","O"]
            ]
            
            grid_after_second_move = move_class.addMove("O", row: 2, column: 2)
            expect(grid_after_second_move).to eq(expected_grid_after_second_move)
    
        end
    end

    context "Testing verify_move method" do
        it "return false when square is already filled" do
            start_test_grid = ([
                ["X","",""],
                ["","",""],
                ["","",""]
            ])
            move_class = Move.new(start_test_grid, false)
            
            is_move_allowed = move_class.verify_move?(row:0 , column: 0)
            
            expect(is_move_allowed).to eq(false)
            
        end
    
        it "returns true when square is empty" do
            start_test_grid = ([
                ["X","",""],
                ["","",""],
                ["","",""]
            ])
            move_class = Move.new(start_test_grid, false)
            
            is_move_allowed = move_class.verify_move?(row:0 , column: 2)    
            
            expect(is_move_allowed).to eq(true)
        end
    end

    context "Testing play move methods" do
        it "makes a player move" do 
            start_test_grid = [
                ["","",""],
                ["","",""],
                ["","",""]
            ]
            move_class = Move.new(start_test_grid, true)
    
            attempted_player_move = [
                ["X","",""],
                ["","",""],
                ["","",""]
            ]
            actual_player_move = move_class.player_move(row:0, column:0)
            
            expect(actual_player_move).to eq(attempted_player_move)
        end 
    
        it "makes a computer move" do 
            start_test_grid = [
                ["","",""],
                ["","",""],
                ["","",""]
            ]
            move_class = Move.new(start_test_grid, false)
            attempted_computer_move = [
                ["O","",""],
                ["","",""],
                ["","",""]
            ]
            actual_computer_move = move_class.computer_move(row:0, column:0)
            
            expect(actual_computer_move).to eq(attempted_computer_move)
        end 
    
        it "makes correct move" do
            start_test_grid = [
                ["","",""],
                ["","",""],
                ["","",""]
            ]
            move_class = Move.new(start_test_grid, true)
            
            attempted_player_move = [
                ["X","",""],
                ["","",""],
                ["","",""]
            ]
            player_move = move_class.play_move(row:0, column:0)
            expect(player_move).to eq(attempted_player_move)
        end
    
        it "makes another correct move" do
            start_test_grid = [
                ["","",""],
                ["","",""],
                ["","",""]
            ]
            move_class = Move.new(start_test_grid, false)
            attempted_computer_move = [
                ["","",""],
                ["","O",""],
                ["","",""]
            ]
            computer_move = move_class.play_move(row:1, column:1)
            expect(computer_move).to eq(attempted_computer_move)
        end
    end 

    context "Testing attempt move method and returns symbol" do
        it "returns win symbol for player" do
            start_test_grid = [ 
                ["X","O",""],
                ["","X","O"],
                ["","",""]
            ]
            move_class = Move.new(start_test_grid, true)
            
            result_of_move = move_class.attempt_move(row:2, column:2)
            
            expect(result_of_move).to eq(:player_win)
        end
    
        it "returns win symbol for AI" do
            start_test_grid = [ 
                ["X","O","X"],
                ["","O","O"],
                ["X","","X"]
            ]
            
            move_class = Move.new(start_test_grid, false)
            
            result_of_move = move_class.attempt_move(row:1, column:0)
            
            expect(result_of_move).to eq(:ai_win)
        end
    
        it "returns draw" do
            start_test_grid = [
                ["O","X","O"],
                ["O","X","X"],
                ["X","O",""]
            ]
            move_class = Move.new(start_test_grid, true)
            
            result_of_move = move_class.attempt_move(row:2, column:2)
            
            expect(result_of_move).to eq(:draw)
        end
    
        it "returns next move" do
            start_test_grid = [
                ["X","X",""],
                ["","","O"],
                ["","",""]
            ]
            move_class = Move.new(start_test_grid, false)
            
            result_of_move = move_class.attempt_move(row:2, column:2)
            
            expect(result_of_move).to eq(:next_move)
        end
    
        it "returns illegal move" do
            start_test_grid = [
                ["X","X",""],
                ["","","O"],
                ["","","O"]
            ]
            move_class = Move.new(start_test_grid, false)
            
            result_of_move = move_class.attempt_move(row:2, column:2)
            
            expect(result_of_move).to eq(:illegal_move)
        end
    end

end