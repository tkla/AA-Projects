require_relative "piece"
require_relative "slideable"

class Rook < Piece 
    include Slideable
    def initialize(color = :NULL, board = nil, pos = nil)
        super 
    end 

    # def valid_moves
    #     moves
    # end

    # def symbol 
    #   "\u2656".encode('utf-8')
    # end
    private 
    # @board 
    # @pos

    def move_dirs
        :H 
    end
end