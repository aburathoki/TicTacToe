require_relative '../lib/grid.rb'
require 'colorize' 


describe GridView do
    it 'displays the starting grid' do

        grid_view = GridView.new
        grid_at_start =  %{

 1 | 2 | #{"3".red}
--- --- ---
 4 | 5 | 6
--- --- ---
 7 | 8 | 9

}.blue

        game_start = grid_view.display()

        expect(game_start).to eq(grid_at_start)

    end
end
