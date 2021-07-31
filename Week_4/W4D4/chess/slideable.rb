require_relative 'null_piece'
module Slideable 
   
    def moves 
        res = []
        case self.class.name
        when "Rook"
            horizontal_dirs.each do |pos| 
                x, y = pos 
                res += grow_unblocked_moves_in_dir(x, y)
            end 
        when "Bishop"
            diagonal_dirs.each do |pos| 
                x, y = pos 
                res += grow_unblocked_moves_in_dir(x, y)
            end 
        when "Queen" 
            horizontal_dirs.each do |pos| 
                x, y = pos 
                res += grow_unblocked_moves_in_dir(x, y)
            end 
            diagonal_dirs.each do |pos| 
                x, y = pos 
                res += grow_unblocked_moves_in_dir(x, y)
            end 

        end 
        res 
    end

    def horizontal_dirs
        HORIZONTAL_DIRS
    end

    def diagonal_dirs 
        DIAGONAL_DIRS
    end

    private 
    HORIZONTAL_DIRS = [ [1,0], [0,1], [0, -1], [-1,0] ]
    DIAGONAL_DIRS = [ [1,1], [1,-1], [-1,1], [-1, -1] ]

    def grow_unblocked_moves_in_dir(dx, dy)
        res = [] 
        start_pos = self.pos
        end_x = start_pos[0] + dx
        end_y = start_pos[1] + dy

        # self.color != board[end_pos].color     
        until board[[end_x, end_y]] != board.null #&& self.color != board[end_pos].color  
            res << [end_x, end_y]
            end_x += dx 
            end_y += dy  
        end
        if !board[[end_x,end_y]].nil? && board[[end_x,end_y]].color != self.color
            res << [end_x, end_y]
        end
        
        res 
    end
end