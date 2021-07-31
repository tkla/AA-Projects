require_relative "piece"
require_relative "slideable"
require 'colorize'

class Queen < Piece 
    include Slideable

    def symbol 
      ("\u2655".encode('utf-8')).colorize(color)
    end
    private 


    def move_dirs
        moves
    end
end