require_relative "code"

class Mastermind
    def initialize(length)
        @secret_code = Code.random(length) 
    end

    def print_matches(c)
        puts "Exact matches: #{@secret_code.num_exact_matches(c)}"
        puts "Near matches: #{@secret_code.num_near_matches(c)}"
    end

    def ask_user_for_guess
        puts "Enter a code"
        c = Code.from_string(gets.chomp)

        print_matches(c)

        @secret_code == c 
    end
end
