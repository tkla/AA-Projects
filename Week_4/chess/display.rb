require_relative 'cursor'
require_relative 'board'
require 'colorize'
class Display
    attr_reader :cursor, :board

    def initialize
        @board = Board.new
        @cursor = Cursor.new([0,0], @board)
    end

    def render
        @board.grid.each_with_index do |row,i|
            row.each_with_index do |pieces,j|
                if [i,j] == @cursor.cursor_pos # || pieces.empty?
                    if !pieces.empty? && @cursor.selected
                        print " #{pieces.to_s.colorize(:yellow)} "
                    elsif !pieces.empty?
                        print " #{pieces.to_s.colorize(:blue)} "
                    else
                        print " #{("\u2014".encode('utf-8')).colorize(:blue)} "
                    end
                else
                    print " #{pieces.to_s} "
                end
            end
            puts
        end
    end
end

d = Display.new
d.render
puts  
puts d.board.in_check?(:green)
puts d.board.checkmate?(:green)

# while d.cursor.get_input != nil
#     d.render
#     puts
# end