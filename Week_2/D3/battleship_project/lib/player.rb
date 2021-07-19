class Player
    def get_move
        puts "enter a position with coordinates separated with a space like '4 7'"
        tmp = gets.chomp 
        tmp.split.map{ |c| c.to_i}
    end
end
