module Slideable 
   
    # :H
    # :D 
    # :HD
    def moves 
        sym = move_dirs
        res = [] 
        
        case sym 
        when :H 
            horizontal_dirs.each do |pos| 
                x, y = pos 
                res += grow_unblocked_moves_in_dir(x, y)
            end 
        when :D 
            diagonal_dirs.each do |pos| 
                x, y = pos 
                res += grow_unblocked_moves_in_dir(x, y)
            end 
        when :HD 
            horizontal_dirs.each do |pos| 
                x, y = pos 
                res += grow_unblocked_moves_in_dir(x, y)
            end 
            diagonal_dirs.each do |pos| 
                x, y = pos 
                res += grow_unblocked_moves_in_dir(x, y)
            end 

        end 

        (res.empty?)? nil : res 
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
        end_pos = [start_pos[0] + dx, start_pos[1] + dy] 

        until board[end_pos] != @null || self.color != board[end_pos].color && board[end_pos] != nil 
            res << end_pos 
            end_pos[0] += dx 
            end_pos[1] += dy 
        end

        res 
    end
end