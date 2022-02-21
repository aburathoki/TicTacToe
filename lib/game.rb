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


end