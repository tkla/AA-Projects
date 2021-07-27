require_relative 'board'

class Piece
    attr_reader :name
    def initialize(color, board, pos)
        @color = color
        @board = board
        @pos = pos
    end

    def to_s
        color.to_s
    end

    def empty?

    end

    def valid_moves
        return moves
    end

    def pos=(val)

    end

    def Symbol
        return color
    end


    def inspect
        @name
    end
end