class HumanPlayer
    attr_reader :mark 
    def initialize(mark = :X)
        @mark = mark 
    end

    def get_position
        puts "Player #{@mark} Enter two numbers with a space in between, ex: 4 2"
        res = gets.chomp

        space = 0 
        res.each_char do |c| 
            space += 1 if c == ' ' 
            if space > 1 || (c != ' ' && !is_number?(c))
                raise "Please enter two numbers separated by exactly one space"
            end 
        end

        res.split.map{ |c| c.to_i}   
    end

    def is_number?(c)
        c.to_f.to_s == c.to_s || c.to_i.to_s == c.to_s
    end
end