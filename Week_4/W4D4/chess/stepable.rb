
module Stepable 

    def direct_move 
        x, y = self.pos 
        res = [] 

        HORIZONTAL_DIRS.each do |pos| 
            end_pos = [x+pos[0], y + pos[1]]
            res << end_pos if board[end_pos] != nil && board[end_pos].color != self.color 
        end

        DIAGONAL_DIRS.each do |pos| 
            end_pos = [x+pos[0], y + pos[1]]
            res << end_pos if board[end_pos] != nil && board[end_pos].color != self.color 
        end
        
        res
    end

    def l_move 
        res = [] 
        row, col= self.pos
        possible_move = [
            [row+2, col+1],
            [row+2, col-1],
            [row+1, col+2],
            [row-1, col+2],
            [row-2, col+1],
            [row-2, col-1],
            [row+1, col-2],
            [row-1, col-2]  
        ]

        possible_move.each do |pos| 
            res << pos if board[pos] != nil && board[pos].color != self.color 
        end
        res
    end

    private 
    HORIZONTAL_DIRS = [ [1,0], [0,1], [0, -1], [-1,0] ]
    DIAGONAL_DIRS = [ [1,1], [1,-1], [-1,1], [-1, -1] ]
end

