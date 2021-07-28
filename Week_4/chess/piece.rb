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

    def empty?
        self.is_a?(NullPiece)
    end

    def valid_moves
        moves
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
        self.valid_moves.include?(end_pos)
    end
end

# pi = Piece.new
# p pi.to_s