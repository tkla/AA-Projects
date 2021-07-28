require_relative 'piece'
require_relative 'stepable'
class King < Piece
    include Stepable
    
    def symbol 
        ("\u2654".encode('utf-8')).colorize(color)
    end

    def moves 
        res = [] 
        res += direct_move  
    end 

    protected 
    def move_diffs 
        moves 
    end
end