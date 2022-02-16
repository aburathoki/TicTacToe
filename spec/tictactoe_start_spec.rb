require_relative '../lib/tictactoe'

describe TicTacToe do
     
    it "return grid at start of the game" do 
        # arrange new version of the class
        tictactoe = TicTacToe.new
        start_grid_test = [
            ["","",""],
            ["","",""],
            ["","",""]
        ]
        # act 0 moves new game
        initial_grid = tictactoe.return_current_grid
        # assert 
        expect(initial_grid).to eq(start_grid_test)
    end

end