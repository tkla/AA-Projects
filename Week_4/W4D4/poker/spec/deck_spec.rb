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

end
