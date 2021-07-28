require_relative "piece"
require_relative 'null_piece'
require_relative 'rook'
require_relative 'bishop'
require_relative 'king'
require_relative 'knight'
require_relative 'pawn'
require_relative 'queen'
class Board
    attr_reader :board, :null
    def initialize
        # include Singleton
        @null = NullPiece.instance
        @board = Array.new(8){Array.new(8, @null)}
        add_pieces
    end

    def add_pieces
        #Top Side
        @board[1].map!.with_index do |piece, i| 
            Pawn.new(:red, self, [1,i])
        end

        @board[0][0] = Rook.new(:red, self, [0,0])
        @board[0][7] = Rook.new(:red, self, [0,7])
        @board[0][1] = Knight.new(:red,self,[0,1])
        @board[0][6] = Knight.new(:red,self,[0,6])
        @board[0][2] = Bishop.new(:red,self,[0,2])
        @board[0][5] = Bishop.new(:red,self,[0,5])

        @board[0][4] = King.new(:red, self, [0,4])
        @board[0][3] = Queen.new(:red, self, [0,3])

        #Bot side
        @board[6].map!.with_index do |piece, i| 
            Pawn.new(:green, self, [1,i])
        end

        @board[7][7] = Rook.new(:green, self,[7,7])
        @board[7][1] = Knight.new(:green, self,[7,1])
        @board[7][0] = Rook.new(:green, self, [7,0])
        @board[7][6] = Knight.new(:green, self, [7,6])
        @board[7][2] = Bishop.new(:green, self, [7,2])
        @board[7][5] = Bishop.new(:green, self, [7,5])
        @board[7][3] = King.new(:green, self, [7,3])
        @board[7][4] = Queen.new(:green, self, [7,4])
        @board
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

    #Basic sanity check, if pos is on board.
    def valid_pos?(pos)
        self[pos] != nil
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
b.move_piece(:red, [1,0], [2,0])
puts 
b.render

b.move_piece(:red, [2,0], [3,0])
puts 

b.render
b.move_piece(:red, [3,0], [4,0])
puts 

