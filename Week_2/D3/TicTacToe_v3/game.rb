require_relative "board"
require_relative "human_player"
require_relative "ComputerPlayer"

class Game 
    def initialize(size, players = {})
        @players = {}
        players.each do |k, v| 
            if v
                @players[k] = ComputerPlayer.new(k)
            else
                @players[k] = HumanPlayer.new(k)
            end
        end
        @board = Board.new(size)
        @player_idx = 0
        @curr_player = @players[@players.keys[@player_idx]]
    end

    def switch_turn
        @player_idx += 1 
        @player_idx = 0 if @player_idx == @players.keys.length 
        @curr_player = @players[@players.keys[@player_idx]]
    end

    def play
        while @board.empty_positions?
            move = @curr_player.get_position(@board.legal_positions)
            @board.place_mark(move, @curr_player.mark)
            @board.print 
            if @board.win?(@curr_player.mark)
                puts "#{@curr_player.mark} Victory!"
                return 
            else 
                switch_turn
            end 
        end

        puts "Draw"
    end
end