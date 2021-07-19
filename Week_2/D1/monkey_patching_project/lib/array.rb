# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array
    private def is_Integer?
        self.all?{ |i| i.is_a? Integer}
    end

    def span
        return nil if !is_Integer? || self.empty?
        self.max - self.min 
     
    end

    def average 
        return nil if !is_Integer? || self.empty?

        self.sum / (self.length.to_f) 
    end
        
    def median
        return nil if self.empty? 
        if self.length % 2 == 0 
            tmp = self.sort 
            return (tmp[tmp.length/2] + tmp[tmp.length/2 -1]) / 2.0
        else 
            tmp = self.sort 
            return tmp[tmp.length/2]
        end
    end

    def counts
        hash = Hash.new(0)
        self.each do |i|
            hash[i] += 1
        end 
        hash 
    end 

    def my_count(arg) 
        count = 0
        self.each do |i| 
            count += 1 if i == arg 
        end 
        count 
    end

    def my_index(arg)
        self.each_with_index do |n, i| 
            return i if n == arg
        end 
        nil
    end

    def my_uniq
        hash = {}
        res = []
        self.each do |i| 
            res << i if !hash.has_key?(i) 
            hash[i] = 1
        end
        res
    end

    def my_transpose
        res = Array.new(self.length){Array.new(self.length)}

        self.each_with_index do |row, idx_r| 
            row.each_with_index do |col, idx_c|
                res[idx_c][idx_r] = col 
            end
        end
        res 
    end
end
