require_relative '../lib/model/ai'

describe AI do
    
    context "Testing available moves" do
        it "gets available moves" do
            grid = [
                ["X","O","O"],
                ["","","O"],
                ["X","O","X"]
            ]
            ai = AI.new(grid)            
                
            available_moves = ai.get_available_moves(grid)
            expect(available_moves).to eq([[1,0],[1,1]])
        end
    
        it "gets available moves" do
            grid = [
                ["","",""],
                ["","",""],
                ["","",""]
            ]
            ai = AI.new(grid)            
            
            available_moves = ai.get_available_moves(grid)
            expect(available_moves).to eq(
                [
                    [0,0],[0,1], [0,2],
                    [1,0],[1,1], [1,2],
                    [2,0],[2,1], [2,2]
                ]
            )
        end
    end

    context "Testing terminal grid method" do
        it "returns 10 if AI has won" do 
            grid = [
                ["X","O","O"],
                ["", "O","X"],
                ["X","O","X"]
            ]
            ai = AI.new(grid)
            
            score = ai.check_grid_for_terminal(grid,true,0)
    
            expect(score).to eq(10)
        end
    
        it "returns -10 if player has won" do
            grid = [
                ["O","X","X"],
                ["", "X","O"],
                ["O","X","O"]
            ]
            ai = AI.new(grid)
            
            score = ai.check_grid_for_terminal(grid,false,0)
    
            expect(score).to eq(-10)
        end
    
        it "returns 0 if draw" do
            grid = [
                ["O","X","X"],
                ["X","O","O"],
                ["O","X","X"]
            ]
            ai = AI.new(grid)
            
            score = ai.check_grid_for_terminal(grid,false,0)
    
            expect(score).to eq(0)
        end
    
        it "returns nil if game is not in terminal state" do
            grid = [
                ["","",""],
                ["", "",""],
                ["","",""]
            ]
            ai = AI.new(grid)
            
            score = ai.check_grid_for_terminal(grid,false,0)
    
            expect(score).to eq(nil)
        end
    end
     
    context "Testing hypothetical move method" do
        it "AI makes hypothetical move and returns new grid" do
            grid = [
                ["X","O","X"],
                ["O","",""],
                ["O","","X"]
            ]
            ai = AI.new(grid)  
    
            ai_moved_grid = ai.make_hypothetical_move(grid,[1,1],false)
    
            expect(ai_moved_grid).to eq([
                ["X","O","X"],
                ["O","O",""],
                ["O","","X"]
            ])
        end
    
        it "AI makes different hypothetical move and returns new grid" do
            grid = [
                ["X","O","X"],
                ["O","",""],
                ["O","","X"]
            ]
            ai = AI.new(grid)  
    
            ai_moved_grid = ai.make_hypothetical_move(grid,[1,1],false)
    
            expect(ai_moved_grid).to eq([
                ["X","O","X"],
                ["O","O",""],
                ["O","","X"]
            ])
    
        end 
    end

    context "Testing rank available moves method" do
        it "returns the best move from available moves when AI to play" do
            grid = [
                ["X","O","O"],
                ["O","",""],
                ["O","X","X"]
            ]
            available_moves = [{:coord=>[1, 1], :result=>10}, {:coord=>[1, 2], :result=>-10}]
            ai = AI.new(grid)  
    
            ai_best_move = ai.ranks_available_moves(available_moves, false)
    
            expect(ai_best_move).to eq({:coord=>[1, 1], :result=>10})
        end
    
        it "returns the best move from other available moves when AI to play" do
            grid = [
                ["X","O","O"],
                ["","",""],
                ["O","","X"]
            ]
            available_moves = [{:coord=>[1, 1], :result=>10}, {:coord=>[1, 2], :result=>-10},{:coord=>[1,0], :result=>10},{:coord=>[2, 1], :result=>-10}]
            ai = AI.new(grid)
    
            ai_best_move = ai.ranks_available_moves(available_moves, false)
    
            expect([{:coord=>[1, 1], :result=>10},{:coord=>[1,0], :result=>10}]).to include(ai_best_move)
        end 
    
    
        it "returns the best move from other available moves when player to play" do 
            grid = [
                ["X","O","O"],
                ["","",""],
                ["O","","X"]
            ]
            available_moves = [{:coord=>[1, 1], :result=>-10}, {:coord=>[1, 2], :result=>10},{:coord=>[1,0], :result=>-10},{:coord=>[2, 1], :result=>10}]
            ai = AI.new(grid)
    
            player_best_move = ai.ranks_available_moves(available_moves, true)
    
            expect([{:coord=>[1, 1], :result=>-10},{:coord=>[1,0], :result=>-10}]).to include(player_best_move)
        end
    end

    context "Testing minimax method" do
        it "returns best AI move according to minimax" do
            grid = [
                ["X","O","X"],
                ["X","O","O"],
                ["","","X"]
            ]
            ai = AI.new(grid)
    
            minimax_result = ai.minimax(grid, false, 0)
    
            expect(minimax_result).to eql({:coord=>[2, 1],:level=>1, :result=>9})
        end
    
        it "returns best AI move according to minimax" do
            grid = [
                ["X","O","O"],
                ["O","",""],
                ["O","X","X"]
            ]
            ai = AI.new(grid)   
            
            minimax_result = ai.minimax(grid, false, 0)
            
            expect(minimax_result).to eq({:coord=>[1, 1],:level=>1, :result=>9})
        end
        
        it "returns best AI move according to minimax" do
            grid = [
                ["","","O"],
                ["","X",""],
                ["O","",""]
            ]
            ai = AI.new(grid)   
            
            minimax_result = ai.minimax(grid, false, 0)
    
            expect([{:coord=>[0, 0], :level=>3, :result=>7}, {:coord=>[2, 2], :level=>3, :result=>7}]).to include(minimax_result)
        end
    end
end



