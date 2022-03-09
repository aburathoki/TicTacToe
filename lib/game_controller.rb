require_relative '../lib/instruct_view'

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

    def respond_to_game_stage(stage)
      case stage
      when :next_move
        if @player_to_play
          player_input = Instruct.new(@grid).ask_for_player_move
          new_stage = attempt_player_move(player_input)
          respond_to_game_stage(new_stage)
        else 
          ai_move_outcome = attempt_ai_move
          respond_to_game_stage(ai_move_outcome)
        end
      when :illegal_move
      when :player_win
      when :ai_win
      when :draw
      end
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
        nil
      else 
        row = (input_int - 1) / 3
        column = (input_int - 1) % 3
        [row, column]
      end

    end

    def attempt_ai_move
      Instruct.new(@grid).say_ai_to_move
      ai_move_hash = AI.new(@grid).minimax(@grid, @player_to_play, 0)
      ai_coord = ai_move_hash[:coord]
      Move.new(@grid, @player_to_play).attempt_move(row: ai_coord[0], column: ai_coord[1])
    end

    
end