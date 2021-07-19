class GuessingGame
    attr_reader :num_attempts

    def initialize(min, max)
        @min = min 
        @max = max 
        @secret_num = rand(min..max)
        @game_over = false
        @num_attempts = 0
    end

    def game_over? 
        @game_over 
    end

    def check_num(n)
        @num_attempts += 1
        if n == @secret_num 
            @game_over = true 
            puts "you win"
        elsif n > @secret_num
            puts "too big"
        else 
            puts "too small"
        end
    end

    def ask_user
        puts("enter a number")
        number = gets.chomp.to_i 
        check_num(number)
    end
end
