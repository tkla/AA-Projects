require_relative "piece"
require 'singleton'

class NullPiece < Piece
    include Singleton
    def initialize
        super
    end

    def symbol 
        ("\u2014".encode('utf-8')).colorize(color)
    end
end