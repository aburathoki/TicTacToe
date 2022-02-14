require_relative '../lib/tictactoe'

describe TicTacToe do
     
    it "return grid at start of the game" do 
        # arrange new version of the class
        tictactoe = TicTacToe.new
        start_grid_test = [["","",""],["","",""],["","",""]]
        # act 0 moves new game
        initial_grid = tictactoe.return_current_grid
        # assert 
        expect(initial_grid).to eq(start_grid_test)
    end

    it "adds first move to grid" do 
        # arrange
        tictactoe = TicTacToe.new
        example_first_move = [
            ["X","",""],
            ["","",""],
            ["","",""]
        ]
        # act
        grid_after_first_move = tictactoe.addMove("X", row: 0, column: 0)
    
        # assert 
        expect(grid_after_first_move).to eq(example_first_move)
        

    end

    it "adds alternative move to grid " do
        # arrange
        tictactoe1 = TicTacToe.new

        puts "******** #{tictactoe1.return_current_grid}"

        example_first_move1 = [
                ["","O",""],
                ["","",""],
                ["","",""]
            ]
        grid_after_second_move = tictactoe1.addMove("O", row: 0, column: 1)
        
        
        # assert
        expect(grid_after_second_move).to eq(example_first_move1)
    end

    it "adds a second move after the first" do
        tictactoe = TicTacToe.new
        tictactoe.grid = [
            ["X","",""],
            ["","",""],
            ["","",""]
        ]

        example_second_move = [
            ["X","",""],
            ["","",""],
            ["","","O"]
        ]
        
        grid_after_second_move = tictactoe.addMove("O", row: 2, column: 2)
        expect(grid_after_second_move).to eq(example_second_move)

    end

end