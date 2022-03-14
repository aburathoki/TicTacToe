1
require_relative '../../lib/view/instruct_view'
require_relative '../../lib/model/move'
require_relative '../../lib/model/ai'

class Game

    attr_accessor :grid, :player_to_play

    def initialize
      @grid = [
          ["","",""],
          ["","",""],
          ["","",""]
        ]
      @player_to_play = [true, false].sample
    end

    def start_game
      respond_to_game_stage(:next_move)
    end

    def respond_to_game_stage(stage)
      case stage
      when :next_move
        respond_to_next_move       
      when :illegal_move     
        respond_to_illegal_move   
      when :player_win
        Instruct.new(@grid).say_player_wins
      when :ai_win
        Instruct.new(@grid).say_ai_wins
      when :draw
        Instruct.new(@grid).say_it_is_a_draw
      end
    end

    def respond_to_next_move 
      @player_to_play = !@player_to_play
      if @player_to_play
        player_input = Instruct.new(@grid).ask_for_player_move
        new_stage = attempt_player_move(player_input)
        respond_to_game_stage(new_stage)
      else 
        ai_move_outcome = attempt_ai_move
        respond_to_game_stage(ai_move_outcome)
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

      if input_int > 0 && input_int < 10
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

    def respond_to_illegal_move 
      player_input = Instruct.new(@grid).ask_for_another_move_after_invalid_move
      new_stage = attempt_player_move(player_input)
      respond_to_game_stage(new_stage)
    end
end
