require_relative '../lib/move'

describe Move do

    it "adds first move to grid" do 
        # arrange

        start_test_grid = [
            ["","",""],
            ["","",""],
            ["","",""]
        ]
        tictactoe = Move.new(start_test_grid, true)
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
        start_test_grid = [
            ["","",""],
            ["","",""],
            ["","",""]
        ]
        tictactoe1 = Move.new(start_test_grid, true)

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
    
       start_test_grid = ([
            ["X","",""],
            ["","",""],
            ["","",""]
        ])
        tictactoe = Move.new(start_test_grid, false)
        example_second_move = [
            ["X","",""],
            ["","",""],
            ["","","O"]
        ]
        
        grid_after_second_move = tictactoe.addMove("O", row: 2, column: 2)
        expect(grid_after_second_move).to eq(example_second_move)

    end

    it "doesn't allow move on same square" do
        start_test_grid = ([
            ["X","",""],
            ["","",""],
            ["","",""]
        ])
        tictactoe = Move.new(start_test_grid, false)
        
        attempted_move = tictactoe.verify_move?(row:0 , column: 0)
        expect(attempted_move).to eq(false)
        
    end

    it "allows a move onto an empty square" do
        start_test_grid = ([
            ["X","",""],
            ["","",""],
            ["","",""]
        ])
        tictactoe = Move.new(start_test_grid, false)
        attempted_move = tictactoe.verify_move?(row:0 , column: 2)    
        expect(attempted_move).to eq(true)
    end

    it "makes a player move" do 
        
        start_test_grid = [
                ["","",""],
                ["","",""],
                ["","",""]
            ]
        tictactoe = Move.new(start_test_grid, true)

        attempted_player_move = [
            ["X","",""],
            ["","",""],
            ["","",""]
        ]
        player_move = tictactoe.play_move(row:0, column:0)
        
        expect(player_move).to eq(attempted_player_move)
    end 

    it "makes a computer move" do 
        start_test_grid = [
            ["","",""],
            ["","",""],
            ["","",""]
        ]
        tictactoe = Move.new(start_test_grid, false)
        attempted_computer_move = [
            ["O","",""],
            ["","",""],
            ["","",""]
        ]
        computer_move = tictactoe.computer_move(row:0, column:0)
        
        expect(computer_move).to eq(attempted_computer_move)
    end 

    it "makes correct move" do
        start_test_grid = [
                ["","",""],
                ["","",""],
                ["","",""]
            ]
        tictactoe = Move.new(start_test_grid, true)
        
        attempted_player_move = [
            ["X","",""],
            ["","",""],
            ["","",""]
        ]
        player_move = tictactoe.play_move(row:0, column:0)
        expect(player_move).to eq(attempted_player_move)
    end

    it "makes correct move" do
        start_test_grid = [
                ["","",""],
                ["","",""],
                ["","",""]
            ]
        tictactoe = Move.new(start_test_grid, false)
        attempted_computer_move = [
            ["","",""],
            ["","O",""],
            ["","",""]
        ]
        computer_move = tictactoe.play_move(row:1, column:1)
        expect(computer_move).to eq(attempted_computer_move)
    end

    it "changes player turn after move" do
        start_test_grid = [
                ["","",""],
                ["","",""],
                ["","",""]
            ]
        tictactoe = Move.new(start_test_grid, true)
        attempted_move = tictactoe.attempt_move(row:0, column:0)
        expect(tictactoe.player_to_play).to eq(false)
    end

    it "changes player turn" do
        start_test_grid = [
                ["X","",""],
                ["","",""],
                ["","",""]
            ]
        tictactoe = Move.new(start_test_grid, false)
        attempted_move = tictactoe.attempt_move(row:0, column:1)
        expect(tictactoe.player_to_play).to eq(true)
    end

    it " doesn't change player turn in invalid move" do
        
        start_test_grid = [
            ["X","O",""],
            ["","",""],
            ["","",""]
        ]
        tictactoe = Move.new(start_test_grid, false)
        attempted_move = tictactoe.attempt_move(row:0, column:1)
        expect(tictactoe.player_to_play).to eq(false)
    end

    it "returns win symbol for player" do
        
        start_test_grid = [ 
            ["X","O",""],
            ["","X","O"],
            ["","",""]
        ]
        tictactoe = Move.new(start_test_grid, true)
        attempted_move = tictactoe.attempt_move(row:2, column:2)
        expect(attempted_move).to eq(:player_win)
    end

    it "returns win symbol for AI" do
        
        start_test_grid = [ 
            ["X","O","X"],
            ["","O","O"],
            ["X","","X"]
        ]
        tictactoe = Move.new(start_test_grid, false)
        attempted_move = tictactoe.attempt_move(row:1, column:0)
        expect(attempted_move).to eq(:ai_win)
    end

    it "returns draw" do
        
        start_test_grid = [
            ["O","X","O"],
            ["O","X","X"],
            ["X","O",""]
        ]
        tictactoe = Move.new(start_test_grid, true)
        attempted_move = tictactoe.attempt_move(row:2, column:2)
        expect(attempted_move).to eq(:draw)
    end

    it "returns next move" do
    start_test_grid = [
            ["X","X",""],
            ["","","O"],
            ["","",""]
        ]
        tictactoe = Move.new(start_test_grid, false)
        attempted_move = tictactoe.attempt_move(row:2, column:2)
        expect(attempted_move).to eq(:next_move)
    end

    it "returns illegal move" do
        start_test_grid = [
            ["X","X",""],
            ["","","O"],
            ["","","O"]
        ]
        tictactoe = Move.new(start_test_grid, false)
        attempted_move = tictactoe.attempt_move(row:2, column:2)
        expect(attempted_move).to eq(:illegal_move)
    end

end