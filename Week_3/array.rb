class Array

    def my_each(&prc)
        i = 0 
        while( i < self.length)
            prc.call(self[i])
            i += 1
        end
        self
    end

    def my_select(&prc)
        res = []
        self.my_each { |el| res << el if prc.call(el) }
        res
    end

    def my_reject(&prc)
        res = []
        self.my_each { |el| res << el if !prc.call(el) }
        res
    end

    def my_any?(&prc)
        self.my_each { |el| return true if prc.call(el) }
        false 
    end

    def my_all?(&prc)
        self.my_each { |el| return false if !prc.call(el) }
        true
    end

    def my_flatten
        return [self] if !self.kind_of?(Array)
        
        # if self[0].kind_of?(Array)
        #     self[0].my_flatten + self[1..-1].my_flatten
        # else 
        #     [self[0]] + self[1..-1].my_flatten
        # end

        res = [] 
        self.my_each do |i|
            if !i.kind_of?(Array) 
                res += [i]  
            else 
                res += i.my_flatten
            end 

        end
        res 
    end


end

#p [1].my_flatten 
#p [1, 2, 3, [4, [5, 6]], [[[7]], 8]].my_flatten # => [1, 2, 3, 4, 5, 6, 7, 8]

# return_value = [1, 2, 3].my_each do |num|
#     puts num
#   end.my_each do |num|
#     puts num
#   end
#   # => 1
#        2
#        3
#        1
#        2
#        3
  
#   p return_value  # => [1, 2, 3]

# a = [1, 2, 3]
# p a.my_select { |num| num > 1 } # => [2, 3]
# p a.my_select { |num| num == 4 } # => []

# puts a = [1, 2, 3]
# p a.my_reject { |num| num > 1 } # => [1]
# p a.my_reject { |num| num == 4 } # => [1, 2, 3]

# p a = [1, 2, 3]
# p a.my_any? { |num| num > 1 } # => true
# p a.my_any? { |num| num == 4 } # => false
# p a.my_all? { |num| num > 1 } # => false
# p a.my_all? { |num| num < 4 } # => true