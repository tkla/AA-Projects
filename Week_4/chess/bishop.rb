require_relative "piece"
require_relative "slideable"
require 'colorize'

class Bishop < Piece 
    include Slideable
    def initialize(color, board = nil, pos = nil)
        super 
    end 

    # def valid_moves
    #     moves
    # end

    def symbol 
      ("\u2657".encode('utf-8')).colorize(color)
    end
    private 
    # @board 
    # @pos

    def move_dirs
        moves
    end
end