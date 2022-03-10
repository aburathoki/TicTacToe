require_relative '../lib/model/ai'

describe AI do
    
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
        
        # 1

        it "returns the value if the terminal state is found" do 
            # arrange
            grid = [
                ["X","O","O"],
                ["", "O","X"],
                ["X","O","X"]
            ]
            ai = AI.new(grid)
           score = ai.check_grid_for_terminal(grid,true)

           expect(score).to eq(10)
        end

        it "returns the value if the terminal state is found" do 
            # arrange
            grid = [
                ["O","X","X"],
                ["", "X","O"],
                ["O","X","O"]
            ]
            ai = AI.new(grid)
           score = ai.check_grid_for_terminal(grid,false)

           expect(score).to eq(-10)
        end

        it "returns the value if the terminal state is found" do 
            # arrange
            grid = [
                ["O","X","X"],
                ["X", "O","O"],
                ["O","X","X"]
            ]
            ai = AI.new(grid)
           score = ai.check_grid_for_terminal(grid,false)

           expect(score).to eq(0)
        end

        it "returns the value if the terminal state is found" do 
            # arrange
            grid = [
                ["","",""],
                ["", "",""],
                ["","",""]
            ]
            ai = AI.new(grid)
           score = ai.check_grid_for_terminal(grid,false)

           expect(score).to eq(nil)
        end

        # 2

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
 
        
       
        
        it "Ai makes move" do
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

    it "Ai makes move" do
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

    it "ranks available moves" do
        # Arrange
        grid = [
                ["X","O","O"],
                ["O","",""],
                ["O","X","X"]
            ]
        input = [{:coord=>[1, 1], :result=>10}, {:coord=>[1, 2], :result=>-10}]
        ai = AI.new(grid)  

        # Act
        ai_best_move = ai.ranks_available_moves(input, false)

        # Assert
        expect(ai_best_move).to eq({:coord=>[1, 1], :result=>10})

    end


    it "ranks available moves" do 
        # Arrange
         grid = [
            ["X","O","O"],
            ["","",""],
            ["O","","X"]
        ]
        input = [{:coord=>[1, 1], :result=>10}, {:coord=>[1, 2], :result=>-10},{:coord=>[1,0], :result=>10},{:coord=>[2, 1], :result=>-10}]
        ai = AI.new(grid)
    
    # Act
    ai_best_move = ai.ranks_available_moves(input, false)

    # Assert
    expect([{:coord=>[1, 1], :result=>10},{:coord=>[1,0], :result=>10}]).to include(ai_best_move)
    end 


    it "ranks available moves" do 
        # Arrange
            grid = [
               ["X","O","O"],
               ["","",""],
               ["O","","X"]
           ]
       input = [{:coord=>[1, 1], :result=>-10}, {:coord=>[1, 2], :result=>10},{:coord=>[1,0], :result=>-10},{:coord=>[2, 1], :result=>10}]
       ai = AI.new(grid)
       
       # Act
       player_best_move = ai.ranks_available_moves(input, true)
   
       # Assert
       expect([{:coord=>[1, 1], :result=>-10},{:coord=>[1,0], :result=>-10}]).to include(player_best_move)
    end 
    
       it "exits minimax function" do
        grid = [
            ["X","O","X"],
            ["X","O","O"],
            ["","","X"]
        ]
        ai = AI.new(grid)   
        minimax_result = ai.minimax(grid, false, 0)
        expect(minimax_result).to eql({:coord=>[2, 1],:level=>1, :result=>10})
    end

    it "Continues minimax recursion" do
        grid = [
            ["X","O","O"],
            ["O","",""],
            ["O","X","X"]
        ]
        ai = AI.new(grid)   
        minimax_result = ai.minimax(grid, false, 0)
        expect(minimax_result).to eq({:coord=>[1, 1],:level=>1, :result=>10})
    end
    
    it "Continues minimax recursion" do
        grid = [
            ["","","O"],
            ["","X",""],
            ["O","",""]
        ]
        ai = AI.new(grid)   
        minimax_result = ai.minimax(grid, false, 0)

        expect([{:coord=>[0, 0], :level=>3, :result=>10}, {:coord=>[2, 2], :level=>3, :result=>10}]).to include(minimax_result)
    end
end



