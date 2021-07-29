class TowersOfHanoi

    attr_accessor :r1, :r2, :r3 

    def initialize 
        @r1 = [3,2,1]
        @r2 = [] 
        @r3 = []
    end

    def play  
        won?
        move(get_move)
        puts "Congrats!"
    end

    def won? 
        @r1.empty? && @r2.empty? && @r3.length == 3
    end

    def get_move

    end

    def move(position)

    end 

end