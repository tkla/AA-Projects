class Board
    attr_reader :size, :s_count

    def initialize(n)
        @grid = Array.new(n){ Array.new(n, :N)}
        @size = n*n 
        @s_count = 0 
    end

    def [](pos)
        row = pos[0]
        col = pos[1]
        @grid[row][col]
    end

    def []=(pos, s)
        row = pos[0]
        col = pos[1]
        @grid[row][col] = s 
        @s_count += 1 if s == :S 
    end

    def num_ships
        @s_count 
    end

    def attack(pos)
        if self[pos] == :S 
            @s_count -= 1 
            self[pos] = :H 
            puts "you sunk my battleship!"
            true 
        else 
            self[pos] = :X 
            false 
        end
    end

    def place_random_ships
        limit = @size / 4 

        while limit > 0
            row = rand(0...@grid.length)
            col = rand(0...@grid.length) 
            pos = [row, col]
            if self[pos] != :S 
                self[pos] = :S 
                limit -= 1
            end 
        end
    end

    def hidden_ships_grid 
        new_grid = @grid.map{ |sub| sub.map{ |n| n}}

        new_grid.each do |sub| 
            sub.each_with_index do |elem, i|
                sub[i] = :N if elem == :S 
            end
        end
        new_grid 
    end

    def self.print_grid(g)
        g.each do |sub| 
            line = ""
            sub.each{ |elem| line += "#{elem} " }
            line[-1] = ""
            puts line
        end 
    end

    def cheat 
        Board.print_grid(@grid)
    end

    def print 
        Board.print_grid(hidden_ships_grid)
    end
end