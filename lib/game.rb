class Game

    attr_accessor :grid, :player_to_play

    def initialize
      @grid = [
          ["","",""],
          ["","",""],
          ["","",""]
        ]
      @player_to_play = true
    end

    def main
      # 1) presenting the grid
      # 2) asks for player input
      # 3) Verify the move
          # a) Ask them to make another
          # b) accept move and make it
      # 4) Check for terminal grid

      ## if false ##

        # 5) ASk AI class for move
        # 6) Make the move for the AI
        # 7) Check for terminal grid

      ## if false ##

        # 8) Run main again

      ## if true ##

        # 8) show grid, and ask if they want to play again

    end

    def attempt_player_move(player_input)
      input_coord = convert_to_coord(player_input)
      if input_coord != nil
        move = Move.new(@grid, @player_to_play)
        move.attempt_move(row: input_coord[0], column: input_coord[1])
      else
        :illegal_move
      end
    end
  
    def convert_to_coord(input)

      input_int = input.to_i

      if input_int == nil || input_int > 9 || input_int < 1
        return nil
      else 
        row = (input_int - 1) / 3
        column = (input_int - 1) % 3

        return [row, column]
      end
    end
end