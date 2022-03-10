require_relative '../lib/controller/game_controller'

describe Game do

    it 'converts input to co-ord' do

        game = Game.new

        player_input = "2"

        converted_input = game.convert_to_coord(player_input)

        expect(converted_input).to eq([0,1])
    end

    it 'attempt move with user input' do

        game = Game.new

        player_input = "2"

        verify_input = game.attempt_player_move(player_input)

        expect(verify_input).to eq(:next_move)
    end
  
    it "enters AI move" do

        game = Game.new

        ai_outome = game.attempt_ai_move

        expect(ai_outome).to eq(:next_move)

    end

end