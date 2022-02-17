require_relative '../lib/tictactoe'

describe TicTacToe do

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
        tictactoe.changeGrid([
            ["X","",""],
            ["","",""],
            ["","",""]
        ])

        example_second_move = [
            ["X","",""],
            ["","",""],
            ["","","O"]
        ]
        
        grid_after_second_move = tictactoe.addMove("O", row: 2, column: 2)
        expect(grid_after_second_move).to eq(example_second_move)

    end

it "doesn't allow move on same square" do
        tictactoe = TicTacToe.new
        tictactoe.changeGrid([
            ["X","",""],
            ["","",""],
            ["","",""]
        ])
    
    attempted_move = tictactoe.verify_move?("O", row:0 , column: 0)
    expect(attempted_move).to eq(false)
    
end

it "allows a move onto an empty square" do
    tictactoe = TicTacToe.new
        tictactoe.changeGrid([
            ["X","",""],
            ["","",""],
            ["","",""]
        ])
    attempted_move = tictactoe.verify_move?("O", row:0 , column: 2)    
    expect(attempted_move).to eq(true)
end

it "attempts illegal move" do 
    tictactoe = TicTacToe.new
    tictactoe.changeGrid([[
        "X","",""],
        ["","",""],
        ["","",""]
    ])

   unchanged_grid = [[
        "X","",""],
        ["","",""],
        ["","",""]
    ]
attempted_move = tictactoe.addMove("O", row:0, column:0)
expect(attempted_move).to eq(unchanged_grid)


end 

it "attempts legal move" do 
    tictactoe = TicTacToe.new
    tictactoe.changeGrid([[
        "X","",""],
        ["","",""],
        ["","",""]
    ])

   changed_grid = [[
        "X","O",""],
        ["","",""],
        ["","",""]
    ]
    attempted_move = tictactoe.addMove("O", row:0, column:1)
    
    expect(attempted_move).to eq(changed_grid)
end 

it "makes a player move" do 
    tictactoe = TicTacToe.new
    tictactoe.changeGrid([
        ["","",""],
        ["","",""],
        ["","",""]
    ])

   attempted_player_move = [
        ["X","",""],
        ["","",""],
        ["","",""]
    ]
    player_move = tictactoe.play_move(row:0, column:0)
    
    expect(player_move).to eq(attempted_player_move)
end 

it "makes a computer move" do 
    tictactoe = TicTacToe.new
    tictactoe.changeGrid([
        ["","",""],
        ["","",""],
        ["","",""]
    ])

   attempted_computer_move = [
        ["O","",""],
        ["","",""],
        ["","",""]
    ]
    computer_move = tictactoe.computer_move(row:0, column:0)
    
    expect(computer_move).to eq(attempted_computer_move)
end 

end