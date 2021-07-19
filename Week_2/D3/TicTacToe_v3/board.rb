class Board 
    def initialize(size)
        @size = size 
        @positions = @size * @size 
        @board = Array.new(@size){Array.new(@size, '_')}
    end

    def valid?(position)
        row = position[0]
        col = position[1]
        return false if row == nil or col == nil 
        return false if row < 0 || col < 0 
        #Is board[row][col] an existing coordinate?
        (@board[row][col] != nil )? true : false 
    end

    def empty?(position)
        row = position[0]
        col = position[1]

        (@board[row][col] == '_' )? true : false 
    end
    
    def legal_positions
        res = [] 

        @board.each_with_index do |c, idx|
            c.each_with_index do |elem, idy|
                pos = [idx, idy]
                res << pos if empty?(pos) 
            end
        end
        res 
    end

    def place_mark(pos, mark)
        if valid?(pos) && empty?(pos)  
            row = pos[0]
            col = pos[1]
            @board[row][col] = mark 
            @positions -= 1
        else 
            raise "Invalid position"
        end
    end

    def print
        @board.each do |sub| 
            line = ""
            sub.each{ |elem| line += "#{elem} " }
            line[-1] = ""
            puts line
        end 
    end

    def win_row?(mark)
        @board.each do |sub|
            flag = true  
            sub.each do |i| 
                flag = false if i != mark 
            end
            return true if flag 
        end 
        false 
    end

    def win_col?(mark)
        i = 0 
        while i < @board.length  
            flag = true 
            @board.each do |c| 
                flag = false if c[i] != mark 
            end
            i += 1
            return true if flag 
        end
        false 
    end

    def win_diagonal?(mark)
        #Check top left 
        left_col = 0 
        left_flag = true
        right_col = @board.length - 1 
        right_flag = true 
        @board.each do |c| 
            left_flag = false if c[left_col] != mark 
            right_flag = false if c[right_col] != mark 
            left_col += 1 
            right_col -= 1
        end
        (left_flag || right_flag)  
    end

    def win?(m) 
        win_col?(m) || win_row?(m) || win_diagonal?(m) 
    end

    def empty_positions? 
        @positions > 0 
    end
end