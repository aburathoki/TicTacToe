require_relative '../lib/tictactoe'

describe TicTacToe do

    context "horizontal line wins" do
            
        it "checks to see if player has won" do
            tictactoe = TicTacToe.new
            tictactoe.changeGrid([
                ["X","X","X"],
                ["O","O",""],
                ["","",""]
            ])

            hasPlayerWon = tictactoe.verify_win_by_row?

            expect(hasPlayerWon).to eq(true)

        end

        it "checks to see if player has won" do
            tictactoe = TicTacToe.new
            tictactoe.changeGrid([
                ["X","O","X"],
                ["X","O","X"],
                ["","",""]
            ])

            hasPlayerWon = tictactoe.verify_win_by_row?

            expect(hasPlayerWon).to eq(false)

        end
    end

    context "vertical line wins" do
            
        it "checks to see if player has won" do
            tictactoe = TicTacToe.new
            tictactoe.changeGrid([
                ["X","O",""],
                ["X","O",""],
                ["X","",""]
            ])

            hasPlayerWon = tictactoe.verify_win_by_column?

            expect(hasPlayerWon).to eq(true)

        end

        it "checks to see if player has won" do
            tictactoe = TicTacToe.new
            tictactoe.changeGrid([
                ["X","O",""],
                ["O","O",""],
                ["X","",""]
            ])

            hasPlayerWon = tictactoe.verify_win_by_column?

            expect(hasPlayerWon).to eq(false)

        end

    end
    context "diagonal line wins" do
            
        it "checks to see if player has won" do
            tictactoe = TicTacToe.new
            tictactoe.changeGrid([
                ["X","O",""],
                ["O","X",""],
                ["X","","X"]
            ])

            hasPlayerWon = tictactoe.verify_win_by_LR_diagonal?

            expect(hasPlayerWon).to eq(true)

        end
        it "checks to see if player has won" do
            tictactoe = TicTacToe.new
            tictactoe.changeGrid([
                ["X","O",""],
                ["O","O",""],
                ["X","","X"]
            ])

            hasPlayerWon = tictactoe.verify_win_by_LR_diagonal?

            expect(hasPlayerWon).to eq(false)

        end
    end    

   context "confirm draw" do 
    it "checks to see if game drawn" do
        tictactoe = TicTacToe.new
        tictactoe.changeGrid([
            ["X","X","O"],
            ["O","O","X"],
            ["X","O","X"]
        ])

        game_drawn = tictactoe.verify_draw?

        expect(game_drawn).to eq(true)

    end

    it "checks to see if game drawn" do
        tictactoe = TicTacToe.new
        tictactoe.changeGrid([
            ["X","X","O"],
            ["O","O","X"],
            ["X","O",""]
        ])

        game_drawn = tictactoe.verify_draw?

        expect(game_drawn).to eq(false)

    end
end

context "confirm win" do 
    it "checks to see if game won" do
        tictactoe = TicTacToe.new
        tictactoe.changeGrid([
            ["X","X","O"],
            ["O","O","O"],
            ["X","O","X"]
        ])

        game_won = tictactoe.verify_win?

        expect(game_won).to eq(true)

    end

    it "checks to see if game won" do
        tictactoe = TicTacToe.new
        tictactoe.changeGrid([
            ["X","X","O"],
            ["O","O",""],
            ["X","O",""]
        ])

        game_won = tictactoe.verify_win?

        expect(game_won).to eq(false)

    end

end


end