require_relative "card.rb"
class Deck

    attr_reader :deck

    SUITS = [:heart, :spade, :club, :diamond]

    def initialize
        @deck = []
        populate_deck

    end

    def populate_deck
        (1..10).each do |val|
            SUITS.each do |suit|
                @deck << Card.new(val, suit)
            end
        end
        @deck.shuffle!
    end

    def draw_card(n)
        hand = [] 
        n.times do 
            hand << @deck.pop 
        end 
        hand 
    end
end