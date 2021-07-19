class Code
    POSSIBLE_PEGS = {
        "R" => :red,
        "G" => :green,
        "B" => :blue,
        "Y" => :yellow
    }

    attr_reader :pegs 

    def initialize(arr)
        @pegs = []

        if !Code.valid_pegs?(arr)
            raise "Invalid pegs"
        else 
            arr.each { |c| @pegs << c.upcase}
        end
    end

    def self.valid_pegs?(arr) 
        arr.each { |c|  return false if !POSSIBLE_PEGS.has_key?(c.upcase) }
        true 
    end

    def self.random(length)
        choice = ['R', 'G', 'B', 'Y']
        res = []

        (0...length).each do |i| 
            res << choice[rand(0..3)]
        end 
        Code.new(res)  
    end

    def self.from_string(str) 
        Code.new(str.split(""))
    end

    def [](idx)
        @pegs[idx]
    end

    def length 
        @pegs.length 
    end

    def num_exact_matches(c)
        count = 0 
        @pegs.each_with_index do |p, i| 
            count += 1 if c.pegs[i] != nil && p == c.pegs[i]
        end
        count 
    end

    def num_near_matches(c) 
        hash = Hash.new(0)
        @pegs.each { |p| hash[p] += 1 }
        #RGRB
        count = 0 
        exact = num_exact_matches(c)
        c.pegs.each do |p| 
            if hash.has_key?(p)
                count += 1 if hash[p] > 0
                hash[p] -= 1 
            end
        end

        count - exact
    end

    def ==(c)
        return false if c.pegs.length != @pegs.length 

        @pegs.each_with_index do |n, i| 
            return false if c.pegs[i] != n 
        end
        true
    end

end
