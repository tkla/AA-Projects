class Board
    attr_reader :size 
    def initialize(size)
        @size = size 
        @grid = Array.new(@size){Array.new(@size)}
    end

    # This Board#print method is given for free and does not need to be modified
    # It is used to make your game playable.
    def print
        @grid.each { |row| p row }
    end

    
    def [](pos)
        @grid[pos[0]][pos[1]]
    end

    def []=(pos, mark)
        row = pos[0]
        col = pos[1]
        @grid[row][col] = mark 
    end

    #Horizontal?
    def complete_row?(mark)
        @grid.each do |c|
            flag = true 
            c.each do |i|
                flag = false if i != mark 
                next 
            end
            return true if flag 
        end
        false 
    end
    
    def complete_col?(mark)
        i = 0 
        while i < @size 
            flag = true 
            @grid.each do |r| 
                flag = false if r[i] != mark 
            end 
            return true if flag 
            i += 1
        end
        false 
    end

    def complete_diag?(mark)
        i = 0 
        while i < @size 
            flag = true 
            @grid.each do |c| 
                flag = false if c[i] != mark 
                i += 1 
            end
            return true if flag 
        end

        i = @size - 1 
        while i >= 0
            flag = true 
            @grid.each do |c| 
                flag = false if c[i] != mark 
                i -= 1 
            end
            return true if flag 
        end
        false 
    end

    def winner?(mark)
        return true if complete_row?(mark) || complete_col?(mark) || complete_diag?(mark)
        false 
    end
end
