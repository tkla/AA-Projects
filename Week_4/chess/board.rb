require_relative "piece"
require_relative 'null_piece'
require_relative 'rook'
require_relative 'bishop'
require_relative 'king'
require_relative 'knight'
require_relative 'pawn'

class Board
    attr_reader :board, :null
    def initialize
        # include Singleton
        @null = NullPiece.instance
        @board = Array.new(8){Array.new(8, @null)}
        add_pieces
    end

    def add_pieces
        @board[0][3] = Rook.new(:green, self, [0,3])
        @board[1][3] = Pawn.new(:red, self, [1,3])
        @board[2][4] = Pawn.new(:green, self, [2,4])
        @board[4][3] = Pawn.new(:green, self, [4,3])
        @board[0][4] = King.new(:red, self, [0,4])
        @board[1][1] = Bishop.new(:red,self,[1,1])
        @board[0][1] = Knight.new(:green,self,[0,1])
        
        # @board[0][1] = Piece.new(:red, self, [0,1])

    end

    # 1. move_piece 
    # 2. Check if valid pos with valid_pos?(pos)
    # 3. If valid get array of valid moves with piece.move_dirs
    # 4. Validate in move_piece 
    # 5. Update piece.pos=

    def move_piece(color, start_pos, end_pos)
        # return nil if board[start_pos].empty?

        original_piece = self[start_pos]
        end_piece = self[end_pos]

        

        if end_piece.color != color || @end_piece.empty?
            self[end_pos] = original_piece
        end

        self[start_pos] = @null
    end

    #Basic sanity check, if pos is on board.
    def valid_pos?(pos)
        
    end

    def [](pos)
        x,y = pos
        return nil if x < 0 || y < 0
        return nil if @board[x] == nil
        @board[x][y]
    end

    def []=(pos, piece)
        x,y = pos
        @board[x][y] = piece
    end

    def render
        @board.each do |row|
            row.each do |pieces|
                print " #{pieces.to_s} "
            end
            puts
        end
    end
end

b = Board.new
#b.move_piece(:W, [0,1], [1,1])
b.render
# print "#{b.board[0][3]} \n"
p b.board[1][3].moves
