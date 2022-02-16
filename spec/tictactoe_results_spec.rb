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

end