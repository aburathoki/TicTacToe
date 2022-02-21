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
    
    attempted_move = tictactoe.verify_move?(row:0 , column: 0)
    expect(attempted_move).to eq(false)
    
end

it "allows a move onto an empty square" do
    tictactoe = TicTacToe.new
        tictactoe.changeGrid([
            ["X","",""],
            ["","",""],
            ["","",""]
        ])
    attempted_move = tictactoe.verify_move?(row:0 , column: 2)    
    expect(attempted_move).to eq(true)
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
it "makes correct move" do
    tictactoe = TicTacToe.new
    tictactoe.player_to_play = true
    attempted_player_move = [
        ["X","",""],
        ["","",""],
        ["","",""]
    ]
    player_move = tictactoe.play_move(row:0, column:0)
    expect(player_move).to eq(attempted_player_move)
end

it "makes correct move" do
    tictactoe = TicTacToe.new
    tictactoe.player_to_play = false
    attempted_computer_move = [
        ["","",""],
        ["","O",""],
        ["","",""]
    ]
    computer_move = tictactoe.play_move(row:1, column:1)
    expect(computer_move).to eq(attempted_computer_move)
end

it "changes player turn after move" do
    tictactoe = TicTacToe.new
    tictactoe.player_to_play = true
    attempted_move = tictactoe.attempt_move(row:0, column:0)
    expect(tictactoe.player_to_play).to eq(false)
end

it "changes player turn" do
    tictactoe = TicTacToe.new
    tictactoe.changeGrid([
        ["X","",""],
        ["","",""],
        ["","",""]
    ])
    tictactoe.player_to_play = false 
    attempted_move = tictactoe.attempt_move(row:0, column:1)
    expect(tictactoe.player_to_play).to eq(true)
end

it " doesn't change player turn in invalid move" do
    tictactoe = TicTacToe.new
    tictactoe.changeGrid([
        ["X","O",""],
        ["","",""],
        ["","",""]
    ])
    tictactoe.player_to_play = false 
    attempted_move = tictactoe.attempt_move(row:0, column:1)
    expect(tictactoe.player_to_play).to eq(false)
end

it "returns win symbol for player" do
    tictactoe = TicTacToe.new
    tictactoe.changeGrid([
        ["X","O",""],
        ["","X","O"],
        ["","",""]
    ])
    tictactoe.player_to_play = true 
    attempted_move = tictactoe.attempt_move(row:2, column:2)
    expect(attempted_move).to eq(:player_win)
end

it "returns win symbol for AI" do
    tictactoe = TicTacToe.new
    tictactoe.changeGrid([
        ["X","O","X"],
        ["","O","O"],
        ["X","","X"]
    ])
    tictactoe.player_to_play = false 
    attempted_move = tictactoe.attempt_move(row:1, column:0)
    expect(attempted_move).to eq(:ai_win)
end

it "returns draw" do
    tictactoe = TicTacToe.new
    tictactoe.changeGrid([
        ["O","X","O"],
        ["O","X","X"],
        ["X","O",""]
    ])
    tictactoe.player_to_play = true 
    attempted_move = tictactoe.attempt_move(row:2, column:2)
    expect(attempted_move).to eq(:draw)
end

it "returns next move" do
    tictactoe = TicTacToe.new
    tictactoe.changeGrid([
        ["X","X",""],
        ["","","O"],
        ["","",""]
    ])
    tictactoe.player_to_play = false 
    attempted_move = tictactoe.attempt_move(row:2, column:2)
    expect(attempted_move).to eq(:next_move)
end

it "returns illegal move" do
    tictactoe = TicTacToe.new
    tictactoe.changeGrid([
        ["X","X",""],
        ["","","O"],
        ["","","O"]
    ])
    tictactoe.player_to_play = true 
    attempted_move = tictactoe.attempt_move(row:2, column:2)
    expect(attempted_move).to eq(:illegal_move)
end

end