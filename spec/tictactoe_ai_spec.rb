require_relative '../lib/ai'

describe AI do

        it "gets available moves" do
            ai = AI.new(
                [
                    ["X","O","O"],
                    ["","","O"],
                    ["X","O","X"]
                ]
            )
            available_moves = ai.get_available_moves
            expect(available_moves).to eq([[1,0],[1,1]])
            end
        
        it "ranks available moves" do
            # arrange
            ai = AI.new(
             [
                ["X","O","O"],
                ["","","O"],
                ["X","O","X"]
            ])

         available_moves = [[1,0],[1,1]]

        #  act
         move_rankings = ai.rank_moves(available_moves)
        
        #  assert 

        expect(move_rankings).to eq([0,1])
       
        end
    end