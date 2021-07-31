class TowersOfHanoi

    attr_accessor :r1, :r2, :r3

    def initialize 
        @r1 = [3,2,1]
        @r2 = [] 
        @r3 = []
        @hash = {
            1 => @r1,
            2 => @r2,
            3 => @r3
        }
    end

    def play
        until won?
            begin 
                move(get_move)
            rescue 
                puts "That is not a valid input"
                retry 
            end
            print " #{@hash} \n"
        end
        puts "Congrats!"
    end

    def won? 
        @r1.empty? && @r2.empty? && @r3.length == 3
    end

    def get_move
        puts "Enter two numbers eg (1 3)"
        user_input = gets.chomp.split(" ").map {|i| Integer(i)}
        raise ArgumentError if user_input.length != 2 
        raise ArgumentError if user_input.any?{ |i| !i.between?(1,3)}
        user_input
    end

    
    def move(position)
        x, y = position    
        if valid_move?(position) 
            @hash[y] << @hash[x].pop 
        else  
            #raise ArgumentError
        end
    end 

    def valid_move?(position)
        x,y = position 
        return false if @hash[x].empty?
        return true if @hash[y].empty?
        return false if @hash[x].last > @hash[y].last
        true
    end
end

t = TowersOfHanoi.new 
t.play