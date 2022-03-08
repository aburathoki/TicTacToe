require 'colorize'

class GridView

    attr_accessor :grid
    def initialize
        @grid =  %{

 1 | 2 | #{"3".red}
--- --- ---
 4 | 5 | 6
--- --- ---
 7 | 8 | 9

}.blue
    end

    def display
        puts grid
        @grid
    end

 end