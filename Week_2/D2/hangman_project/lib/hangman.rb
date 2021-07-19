class Hangman
    DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]
    
    attr_reader :guess_word, :attempted_chars, :remaining_incorrect_guesses
    

    def initialize
        @secret_word = Hangman.random_word
        @guess_word = Array.new(@secret_word.length, '_')
        @attempted_chars = [] 
        @remaining_incorrect_guesses = 5
    end 

    def self.random_word
        DICTIONARY.sample
    end

    def already_attempted?(c)
        if @attempted_chars.include?(c.downcase) 
            return true 
        else  
            false 
        end
    end

    def get_matching_indices(c)
        res = []
        @secret_word.each_char.with_index do |char, i| 
            res << i if c == char 
        end 
        res 
    end

    def fill_indices(c, indices)
        indices.each { |i| @guess_word[i] = c }
    end

    def try_guess(lowcase)
        res = false 
        indices = get_matching_indices(lowcase)
        if already_attempted?(lowcase)
            puts "that has already been attempted"
        else 
            @attempted_chars << lowcase
            res = true 
        end

        if indices.empty? 
            @remaining_incorrect_guesses -= 1 
        else 
            fill_indices(lowcase, indices)
        end

        res 
    end

    def ask_user_for_guess
        puts "Enter a char:"

        try_guess(gets.chomp.downcase)
    end

    def win?
        if @guess_word.join == @secret_word 
            puts "WIN"
            true 
        else 
            false 
        end 
    end 

    def lose? 
        if @remaining_incorrect_guesses == 0
            puts "LOSE"
            true 
        else
            false 
        end
    end

    def game_over?
        if win? || lose? 
            puts @secret_word 
            true 
        else 
            false 
        end 
    end

end
