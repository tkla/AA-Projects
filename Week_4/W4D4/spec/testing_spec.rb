require 'testing.rb'
require 'rspec'

describe "Array" do 
    describe "#uniq" do 
        it "Removes duplicates from an array and returns elements in the same order" do 
            expect([1,2,1,3,3].uniq).to eq([1,2,3]) 
        end 
    end 
    describe "#my_uniq" do 
        it "Removes duplicates from an array and returns elements in the same order" do 
            expect([1,2,1,3,3].my_uniq).to eq([1,2,3]) 
        end 
    end 

    describe "#two_sum" do 
        it "Find all pairs of positons where elems at those pos sums to 0" do 
            expect([-1,0,2,-2,1].two_sum).to eq([[0,4],[2,3]])
        end 

        it "Returns smaller index before bigger index" do 
            expect([-1,0,2,-2,1].two_sum).to_not eq([[2,3],[0,4]])
        end 
    end

    describe "#my_transpose" do 
        it "Converts between row oriented and col oriented representations of a matrix" do 
            matrix = [
                [0, 1, 2],
                [3, 4, 5],
                [6, 7, 8]
              ]

            matrix_transposed = [
                [0, 3, 6],
                [1, 4, 7],
                [2, 5, 8]
            ]

            expect (matrix.my_transpose).to eq(my_transposed)
        end 
    end
end  
