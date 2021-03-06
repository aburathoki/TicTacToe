require_relative '../lib/model/move'

describe Verify do

    context "horizontal line wins" do
            
        it "checks to see if player has won" do
            start_grid_test = [
                ["X","X","X"],
                ["O","O",""],
                ["","",""]
            ]
            tictactoe = Verify.new(start_grid_test)
            
            hasPlayerWon = tictactoe.verify_win_by_row?

            expect(hasPlayerWon).to eq(true)

        end

        it "checks to see if player has won" do
            start_grid_test = [
                ["X","O","X"],
                ["X","O","X"],
                ["","",""]
            ]
            
            tictactoe = Verify.new(start_grid_test)

            hasPlayerWon = tictactoe.verify_win_by_row?

            expect(hasPlayerWon).to eq(false)

        end
    end

    context "vertical line wins" do
            
        it "checks to see if player has won" do
            start_grid_test = [
                ["X","O",""],
                ["X","O",""],
                ["X","",""]
            ]
            tictactoe = Verify.new(start_grid_test)

            hasPlayerWon = tictactoe.verify_win_by_column?

            expect(hasPlayerWon).to eq(true)

        end

        it "checks to see if player has won" do

            start_grid_test = [
                ["X","O",""],
                ["O","O",""],
                ["X","",""]
            ]

            tictactoe = Verify.new(start_grid_test)

            hasPlayerWon = tictactoe.verify_win_by_column?

            expect(hasPlayerWon).to eq(false)

        end

    end

    context "diagonal line wins" do
            
        it "checks to see if player has won" do
            start_test_grid = [
                ["X","O",""],
                ["O","X",""],
                ["X","","X"]
            ]

            tictactoe = Verify.new(start_test_grid)

            hasPlayerWon = tictactoe.verify_win_by_LR_diagonal?

            expect(hasPlayerWon).to eq(true)

        end

        it "checks to see if player has won" do

            start_test_grid = [
                ["X","O",""],
                ["O","O",""],
                ["X","","X"]
            ]

            tictactoe = Verify.new(start_test_grid)

            hasPlayerWon = tictactoe.verify_win_by_LR_diagonal?

            expect(hasPlayerWon).to eq(false)

        end
    end    

   context "confirm draw" do 
        it "checks to see if game drawn" do
            start_test_grid = [
                ["X","X","O"],
                ["O","O","X"],
                ["X","O","X"]
            ]

            tictactoe = Verify.new(start_test_grid)

            game_drawn = tictactoe.verify_draw?

            expect(game_drawn).to eq(true)

        end

        it "checks to see if game drawn" do
            start_test_grid = [
                ["X","X","O"],
                ["O","O","X"],
                ["X","O",""]
            ]

            tictactoe = Verify.new(start_test_grid)

            game_drawn = tictactoe.verify_draw?

            expect(game_drawn).to eq(false)

        end
    end

    context "confirm win" do 
        it "checks to see if game won" do

            start_test_grid = [
                ["X","X","O"],
                ["O","O","O"],
                ["X","O","X"]
            ]

            tictactoe = Verify.new(start_test_grid)

            game_won = tictactoe.verify_win?

            expect(game_won).to eq(true)

        end

        it "checks to see if game won" do

            start_test_grid = [
                ["X","X","O"],
                ["O","O",""],
                ["X","O",""]
            ]

            tictactoe = Verify.new(start_test_grid)

            game_won = tictactoe.verify_win?

            expect(game_won).to eq(false)

        end

    end


end