require_relative '../lib/ai'

describe AI do
    
        # it "gets available moves" do
        #     grid = [
        #         ["X","O","O"],
        #         ["","","O"],
        #         ["X","O","X"]
        #     ]
        #     ai = AI.new(grid)            
            
        #     available_moves = ai.get_available_moves(grid)
        #     expect(available_moves).to eq([[1,0],[1,1]])
        #     end
        
        # it "ranks available moves" do
        #     # arrange
        #     grid = [
        #         ["X","O","O"],
        #         ["","","O"],
        #         ["X","O","X"]
        #     ]
        #     ai = AI.new(grid)    
        #     available_moves = [[1,0],[1,1]]

        #     #  act
        #     move_rankings = ai.rank_moves(grid)
            
        #     #  assert 

        #     expect(move_rankings).to eq([0,10])
       
        # end



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
 
        # 3
        it "exits minimax function" do
            grid = [
                ["X","O","X"],
                ["O","O","X"],
                ["","","X"]
            ]
            ai = AI.new(grid)   
            minimax_result = ai.minimax(grid, false)
            expect(minimax_result).not_to eql(nil)
        end

        it "Continues minimax recursion" do
            grid = [
                ["X","O","X"],
                ["O","",""],
                ["O","","X"]
            ]
            ai = AI.new(grid)   
            minimax_result = ai.minimax(grid, false)
            expect(minimax_result).to eq(nil)
        end
        

    end