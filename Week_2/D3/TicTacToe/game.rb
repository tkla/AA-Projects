require_relative "board"
require_relative "human_player"

class Game 
    def initialize(player1, player2)
        @player_one = HumanPlayer.new(player1)
        @player_two = HumanPlayer.new(player2)
        
        @board = Board.new 
        @current_player = @player_one 
    end

    def switch_turn
        if @current_player == @player_one 
            @current_player = @player_two
        else 
            @current_player = @player_one 
        end
    end

    def play 
        while @board.empty_positions?
            move = @current_player.get_position
            @board.place_mark(move, @current_player.mark)
            @board.print 
            if @board.win?(@current_player.mark)
                puts "#{@current_player.mark} Victory!"
                return 
            else 
                switch_turn
            end 
        end

        puts "Draw"
    end
end