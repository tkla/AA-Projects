class Board
    attr_reader :max_height

    def initialize(stacks, height)
        @max_height = height 
        @stacks = Board.build_stacks(stacks)

        if stacks < 4 || height < 4
            raise "rows and cols must be >=4"
        end
    end

    def self.build_stacks(stacks) 
        res = Array.new(stacks) {Array.new{[]}}
    end

    # This Board#print method is given for free and does not need to be modified
    # It is used to make your game playable.
    def print
        @stacks.each { |stack| p stack }
    end

    def add(token, idx)
        if @stacks[idx].length < @max_height
            @stacks[idx] << token 
            true 
        else 
            false 
        end 
    end

    def vertical_winner?(token)
        @stacks.each do |s| 
            flag = true 
            next if s.length < @max_height 
                 
            s.each do |x| 
                flag = false if x != token 
            end
            return true if flag 
        end
        false 
    end

    def horizontal_winner?(token)
        col = 0 
        while col < @max_height
            flag = true 
            @stacks.each do |s| 
                flag = false if s[col] == nil || s[col] != token 
            end
            return true if flag 
            col += 1 
        end
        false
    end

    def winner?(token)
        horizontal_winner?(token) || vertical_winner?(token)
    end
end
