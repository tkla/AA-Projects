require_relative 'card'

class Board

    def initialize(size = 4)
        @size = size 
        @num_card = @size * @size 
        @board = Array.new(@size){Array.new(@size)}
        @set = "abcdefghijklmnopqrstuv"
    end

    def populate
        #Need to generate random pair of letters
        #Assign to cards
        #Place randomly on board
        deck = []
        tmp = @set.split("").shuffle
        
        (@num_card/2).times do
            random_char = tmp.pop 
            card1 = Card.new(random_char)
            card2 = Card.new(random_char)
            #populate board with 2 cards randomly
            deck << card1 
            deck << card2 
        end

        deck.shuffle
        @board.each_with_index do |r, i| 
            r.each.with_index do |c, j|
                row, col = i, j 
                @board[row][col] = deck.pop 
            end 
        end 
    end

    def [](pos)
        row, col = pos 
        @board[row][col]
    end

    def []=(pos, mark)
        row, col = pos 
        @board[row][col] = mark
    end

    def render 
        @board.each do |r|
            r.each do |card|
                print "#{card.display} "
            end
            print "\n"
        end
    end

    def won? 
        @board.all? do |row| 
            row.all? { |card| card.face_up?}
        end      
    end

    def reveal(guessed_pos)
        row,col = guessed_pos
        @board[row][col].reveal
        @board[row][col]
    end

end