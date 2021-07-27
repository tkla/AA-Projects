require_relative 'piece'
require_relative 'null_piece'

class Board
    def initialize
        # include Singleton
        # @null = NullPiece.instance
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
        @board[0][3] = Piece.new('Queen')
        @board[0][1] = Piece.new('Knight')

    end

    def move_piece(color, start_pos, end_pos)
        return nil if board[start_pos].is_a?(NullPiece) 
        original_piece = board[start_pos]
        end_piece = board[end_pos]

        board[start_pos] = @null

        if end_piece != @null && end_piece.color != color || @end_piece == @null
            board[end_pos] = original_piece
        end
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
            row.each do |piece|
                p piece
            end
            puts
        end
    end
end

# b = Board.new
# b.render