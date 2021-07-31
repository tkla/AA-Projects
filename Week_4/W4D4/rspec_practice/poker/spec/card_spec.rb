require "card.rb"
require "rspec"

describe "card" do
    subject(:card) { Card.new(1, :spade) }

    describe "#initialize" do
        it "creates new card instance" do
            expect { Card.new(2, :heart) }.to_not raise_error
        end
        
        it "sets value and suit" do
            expect(card.val).to eq(1)
            expect(card.suit).to eq(:spade)
        end
    end
end
