require_relative '../lib/game'

describe Game do
     
    it "return blank grid at start of the game" do 
        # arrange new version of the class
        start_grid_test = [
            ["","",""],
            ["","",""],
            ["","",""]
        ]
        tictactoe = Game.new
        
        # act 0 moves new game
        initial_grid = tictactoe.grid
        # assert 
        expect(initial_grid).to eq(start_grid_test)
    end

end