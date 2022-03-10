require_relative '../../lib/view/grid_view'

class Instruct

    def initialize(grid_state)
        @grid_view = GridView.new(grid_state)
    end

    def ask_for_player_move
        @grid_view.display
        puts 'Your move! Enter a number between 1-9:'
        gets.chomp
    end

    def say_ai_to_move
        puts 'AI is making its move...'
    end
    
    def ask_for_another_move_after_invalid_move
        @grid_view.display
        puts 'Invalid move. Please enter an available number between 1-9:'
        gets.chomp
    end

    def say_ai_wins
        @grid_view.display
        puts 'AI has won! Sorry. Game over.'
    end

    def say_it_is_a_draw
        @grid_view.display
        puts 'It is a draw. Game over.'
    end

    def say_player_wins
        @grid_view.display
        puts 'You have won!'
    end

end