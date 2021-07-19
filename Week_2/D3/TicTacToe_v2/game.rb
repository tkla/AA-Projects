require_relative "board"
require_relative "human_player"

class Game 
    def initialize(size, *players)
        @players = players.map { |m| HumanPlayer.new(m)} 
        
        @board = Board.new(size)
        @player_idx = 0
    end

    def switch_turn
        @player_idx += 1 
        @player_idx = 0 if @player_idx == @players.length 
    end

    def play 
        while @board.empty_positions?
            move = @players[@player_idx].get_position
            @board.place_mark(move, @players[@player_idx].mark)
            @board.print 
            if @board.win?(@players[@player_idx].mark)
                puts "#{@players[@player_idx].mark} Victory!"
                return 
            else 
                switch_turn
            end 
        end

        puts "Draw"
    end
end