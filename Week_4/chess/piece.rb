# require_relative 'board'

class Piece
    attr_reader :color, :board, :pos
    def initialize(color = :white, board = nil, pos = nil)
        @color = color
        @board = board
        @pos = pos
    end

    def to_s
        symbol.to_s.colorize(color)
    end

    def moves 
        []
    end
    
    def empty?
        self.is_a?(NullPiece)
    end

    def valid_moves
        moves.select { |pos| !move_into_check?(pos) }
    end

    def dup_board
        duped_board = []
        @board.each do |row|
            duped_row = []
            row.each do |piece|
                duped_row << piece
            end
            duped_board << duped_row
        end
        duped_board
    end

    def pos=(val)
        @pos = val
    end

    def symbol
        return "_"
    end

    def inspect
        @color
    end

    private
    def move_into_check?(end_pos)
        d = dup_board

        curr_pos = self.pos 
        d[curr_pos].move_piece
        d.in_check?(self.color)
        #iterate over piece's moves
        #with dup'd board, make the move
        #check to see if those moves changes the output of in_check?
        #return true or false
    end
end

# pi = Piece.new
# p pi.to_s