require "deck.rb"
require "rspec"

describe "deck" do
    subject(:deck) { Deck.new }

    describe "#initialize" do
        it "creates a new deck" do
            expect{ Deck.new }.to_not raise_error
        end

        # it "calls #populate_deck" do
        #     allow(subject).to receive(:populate_deck) 
        # end
    end

    describe "#populate" do
        it "fills deck instance variable with 40 cards" do
            expect(subject.deck.length).to eq(40)
        end
    end

    describe "#draw_card" do 
        deck2 = Deck.new 
        it "Draws n cards out of the deck." do 
            expect(deck2.draw_card(1)).to be_an_instance_of(Array)
        end 

        it "Should remove 1 card out of the deck when n = 1" do
            expect(deck2.deck.length).to eq(39)
        end

    end

end
