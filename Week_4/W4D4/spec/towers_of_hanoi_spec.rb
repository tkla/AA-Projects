require 'towers_of_hanoi'
require 'rspec'

describe "TowerOfHanoi" do 
    subject(:tower_of_hanoi) {TowersOfHanoi.new}
    describe "#Initialize" do 
        
        it "Creates 3 arrays" do 
            expect(subject.r1).to eq([3,2,1])
            expect(subject.r2).to eq([])
            expect(subject.r3).to eq([])
        end 
    end
end