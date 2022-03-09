require 'colorize'

class GridView

    attr_accessor :grid, :grid_state, :grid_items
    def initialize(grid_state)
        @grid_state = grid_state 
        @grid_items = [1,2,3,4,5,6,7,8,9]

        add_state_to_view

        @grid =  %{

 #{@grid_items[0]} | #{@grid_items[1]} | #{@grid_items[2]}
--- --- ---
 #{@grid_items[3]} | #{@grid_items[4]} | #{@grid_items[5]}
--- --- ---
 #{@grid_items[6]} | #{@grid_items[7]} | #{@grid_items[8]}

}
              
    end

    def display
        puts @grid
        @grid
    end

    def add_state_to_view
    
        flatten_grid = @grid_state.flatten

        for i in 0..@grid_items.count-1
            
            if flatten_grid[i] != ""
                @grid_items[i] = flatten_grid[i]
            end

        end 

    end
    
 end