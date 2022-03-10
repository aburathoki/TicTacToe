require_relative '../lib/view/grid_view'
require 'colorize' 

describe GridView do
  it 'displays the starting grid' do
      grid_state = [
          ["","",""],
          ["","",""],
          ["","",""]
        ]
      grid_view = GridView.new(grid_state)
      grid_at_start =  %{

 1 | 2 | 3
--- --- ---
 4 | 5 | 6
--- --- ---
 7 | 8 | 9

}

      game_start = grid_view.display()

      expect(game_start).to eq(grid_at_start)

  end


  it 'displays full grid' do
      grid_state = [
          ["","O","X"],
          ["","",""],
          ["","",""]
        ]
      grid_view = GridView.new(grid_state)
      grid_at_end =  %{

 1 | #{"O".yellow} | #{"X".cyan}
--- --- ---
 4 | 5 | 6
--- --- ---
 7 | 8 | 9

}

      game_in_play = grid_view.display

      expect(game_in_play).to eq(grid_at_end)
  end 

end