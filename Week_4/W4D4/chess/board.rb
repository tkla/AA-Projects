require_relative "piece"
require_relative 'null_piece'
require_relative 'rook'
require_relative 'bishop'
require_relative 'king'
require_relative 'knight'
require_relative 'pawn'
require_relative 'queen'
class Board
    attr_reader :grid, :null, :king_green
    def initialize
        # include Singleton
        @null = NullPiece.instance
        @grid = Array.new(8){Array.new(8, @null)}
        @king_green = nil
        @king_red = nil
        add_pieces
    end

    def add_pieces
        #Top Side
        @grid[1].map!.with_index do |piece, i| 
            Pawn.new(:red, self, [1,i])
        end

        self[[0,7]] = Rook.new(:red, self, [0,7])
        self[[0,1]] = Knight.new(:red,self,[0,1])
        self[[0,0]] = Rook.new(:red, self, [0,0])
        self[[0,6]] = Knight.new(:red,self,[0,6])
        self[[0,2]] = Bishop.new(:red,self,[0,2])
        self[[0,5]] = Bishop.new(:red,self,[0,5])
        self[[0,4]] = King.new(:red, self, [0,4])
        self[[0,3]] = Queen.new(:red, self, [0,3])
        @king_red = self[[0,4]]

        #Bot side
        @grid[6].map!.with_index do |piece, i| 
            Pawn.new(:green, self, [6,i])
        end

        self[[7,7]] = Rook.new(:green, self,[7,7])
        self[[7,1]] = Knight.new(:green, self,[7,1])
        self[[7,0]] = Rook.new(:green, self, [7,0])
        self[[7,6]] = Knight.new(:green, self, [7,6])
        self[[7,2]] = Bishop.new(:green, self, [7,2])
        self[[7,5]] = Bishop.new(:green, self, [7,5])
        self[[7,4]] = Queen.new(:green, self, [7,4])
        self[[0,2]] = King.new(:green, self, [0,2])
        @king_green = self[[0,2]]

        @grid
    end

    # 1. move_piece 
    # 2. Check if valid pos with valid_pos?(pos)
    # 3. If valid get array of valid moves with piece.move_dirs
    # 4. Validate in move_piece 
    # 5. Update piece.pos=

    def move_piece(color, start_pos, end_pos)
        return nil if self[start_pos].empty?
        
        raise ArgumentError.new("Non-valid start position") if !valid_pos?(start_pos)
        raise ArgumentError.new("Non-valid end position") if !valid_pos?(end_pos)
        res = self[start_pos].moves

        if res.include?(end_pos) 
            self[start_pos], self[end_pos] = @null, self[start_pos]
            self[end_pos].pos = end_pos 
        else
            raise ArgumentError.new("Wrong")
        end 
    end

    #Basic sanity check, if pos is on grid.
    def valid_pos?(pos)
        self[pos] != nil
    end

    def [](pos)
        x,y = pos
        return nil if x < 0 || y < 0
        return nil if @grid[x] == nil
        @grid[x][y]
    end

    def []=(pos, piece)
        x,y = pos
        @grid[x][y] = piece
    end

    def in_check?(color)
        color == :green ? current_king = @king_green : current_king = @king_red

        @grid.each do |row|
            row.each do |piece|
                if piece.color != current_king.color
                    return true if piece.moves.include?(current_king.pos)
                end
            end
        end
        false
    end

    def checkmate?(color)
        return false if !in_check?(color)
        color == :green ? current_king = @king_green : current_king = @king_red

        return true if !current_king.valid_moves.empty?
        @grid.each do |row|
            row.each do |piece|
                if piece.color == color
                    return true if !piece.valid_moves.empty?
                end
            end
        end
        false
    end
end


