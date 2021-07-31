class Array 
    def my_uniq
        new_arr = [] 
        self.each do |elem| 
            new_arr << elem if !new_arr.include?(elem) 
        end
        new_arr
    end

    def two_sum
        pairs = [] 
        (0...self.length).each do |i| 
            (i+1...self.length).each do |j| 
                if self[i] + self[j] == 0 
                    pairs << [i, j]
                end 
            end
        end
        pairs 
    end

    def my_transpose
        cols = [] 
        (0...self.length).each do |i|
            col = []
            (0...self.length).each do |j|
                col << self[j][i]
            end
            cols << col
        end
        cols     
    end

    def stock_pick
        max_profit = []
        sum = 0

        self.each_with_index do |p, i|
            (i...self.length).each do |j|
                if self[j] - p > sum
                    max_profit = [i, j]
                    sum = self[j] - p
                end
            end
        end

        max_profit
    end
end