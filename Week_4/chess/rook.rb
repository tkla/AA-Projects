require_relative "piece"
require_relative "slideable"
require 'colorize'

class Rook < Piece 
    include Slideable

    # def valid_moves
    #     moves
    # end

    def symbol 
      ("\u2656".encode('utf-8')).colorize(color)
    end
    private 
    # @board 
    # @pos

    def move_dirs
        moves
    end
end

# k = Rook.new(:red, nil, nil)
