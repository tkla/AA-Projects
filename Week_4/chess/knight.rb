require_relative 'piece'

class Knight < Piece 
    include Stepable

    def symbol 
        ("\u2658".encode('utf-8')).colorize(color)
    end

    def moves 
        res = []
        res += l_move
    end

    protected
    def move_diffs 
        moves 
    end
end