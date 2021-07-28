require_relative "piece"
require_relative "slideable"

class Rook < Piece 
    include Slideable
    def initialize 
        super 
    end 

    # def valid_moves
    #     moves
    # end

    private 
    # @board 
    # @pos

    def move_dirs
        :H 
    end
end