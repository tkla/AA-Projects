require 'deck'
require 'card' 

class Hand 
    attr_reader :hand
    def initialize(deck)
        @hand = deck.draw_card(5).sort
        @deck = deck 
    end

    def add_card
        #sort
    end
    
    def hand_val 
        points = [straight_flush, four_kind, fullhouse, flush, straight, three_kind, two_pair, pair]
    end

    def pair 

    end
    
    def two_pair 

    end

    def three_kind
    end 

    def straight
    end 

    def flush 
    end 

    def fullhouse 
    end 

    def four_kind 
    end 

    def straight_flush
        return 0 if !@hand.all?{ |c| c.suit == @hand[0].suit}
        i = 0 
        @hand.map{ |c| } 
    end
end