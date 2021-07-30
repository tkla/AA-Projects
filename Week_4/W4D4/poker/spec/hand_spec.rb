require 'hand.rb'
require 'rspec'
# require 'deck'

describe "Hand"

    describe "#initialize" do
        let(:deck) {double("deck", :draw_card => [1,2,3,4,5])}
        subject(:hand){Hand.new(deck)}

        it "Takes deck as arguments and initiate @hand to be array of 5 cards" do 
            expect(subject.hand.length).to eq(5)
        end

end