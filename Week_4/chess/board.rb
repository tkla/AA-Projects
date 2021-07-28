require_relative "piece"
require_relative 'null_piece'

class Board
    attr_reader :board
    def initialize
        # include Singleton
        @null = NullPiece.instance
        @board = Array.new(8){Array.new(8, @null)}
        # @queen = Piece.new("Queen")
        # @rook = Piece.new('Rook')
        # @knight = Piece.new('Knight')
        # @bishop = Piece.new('Bishop')
        # @king = Piece.new('King')
        # @pawn = Piece.new('Pawn')
        set_pieces
    end

    def set_pieces
        @board[0][3] = Piece.new("\u2656".encode('utf-8'), self, [0,3])
        @board[0][1] = Piece.new(:B, self, [0,1])

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
        @board[x][y]
    end

    def []=(pos, piece)
        x,y = pos
        @board[x][y] = piece
    end

    def render
        @board.each do |row|
            row.each do |pieces|
                print pieces.to_s.ljust(5)
            end
            puts
        end
    end
end

b = Board.new
b.move_piece(:W, [0,1], [1,1])
b.render