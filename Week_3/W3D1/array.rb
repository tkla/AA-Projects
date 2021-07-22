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
        #     self[0].my_flatten + self[1...self.length].my_flatten
        # else 
        #     [self[0]] + self[1..self.length].my_flatten
        # end
        # res = []
        
        # if self[0].kind_of?(Array)
        #     self[0].my_flatten + self[1...self.length].my_flatten
        # else
        #     res << self[0]
        #     res.compact
        #     self[1...self.length].my_flatten
        # end
        # res

        # def flatten(data)
        #     return [data].compact if !data.kind_of?(Array)
        
        #     flatten(data[0]) + flatten(data[1...data.length])
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

    def my_zip(*args)
        new_arr = []

        i = 0
        self.my_each do |ele|
            temp = []
            temp << ele
            args.my_each { |n| temp << n[i] }
            i += 1
            new_arr << temp
        end

        new_arr
        
    end

    def my_rotate(n=1)
        new_arr = Array.new(self.length)
        i = 0
        self.my_each do |ele|

            new_idx = i - n
            if new_idx.abs > self.length-1
                new_idx = new_idx%self.length
            end
            new_arr[new_idx] = ele
            i += 1
        end
        new_arr
    end

    def my_join(char="")
        res = ""
        self.my_each { |i| res << i + char }
        res
    end

    def my_reverse
        res = []
        self.my_each { |i| res.unshift(i) }
        res
    end

    def factors(num)
        res = []
        (1..num).each do |i| 
            res << i if num % i == 0
        end
        #
        res 
    end

    def bubble_sort!(&prc)
    end
  
    def bubble_sort(&prc)
    end

end
a = [10]
p a.factors(10)
# p [ "a", "b", "c" ].my_reverse   #=> ["c", "b", "a"]
# p [ 1 ].my_reverse               #=> [1]

# a = [ "a", "b", "c", "d" ]
# p a.my_join         # => "abcd"
# p a.my_join("$")    # => "a$b$c$d"

# a = [ "a", "b", "c", "d" ]
# p a.my_rotate         #=> ["b", "c", "d", "a"]
# p a.my_rotate(2)      #=> ["c", "d", "a", "b"]
# p a.my_rotate(-3)     #=> ["b", "c", "d", "a"]
# p a.my_rotate(15)     #=> ["d", "a", "b", "c"]

# a = [ 4, 5, 6 ]
# b = [ 7, 8, 9 ]
# p [1, 2, 3].my_zip(a, b) # => [[1, 4, 7], [2, 5, 8], [3, 6, 9]]
# p a.my_zip([1,2], [8])   # => [[4, 1, 8], [5, 2, nil], [6, nil, nil]]
# p [1, 2].my_zip(a, b)    # => [[1, 4, 7], [2, 5, 8]]

# c = [10, 11, 12]
# d = [13, 14, 15]
# p [1, 2].my_zip(a, b, c, d)    # => [[1, 4, 7, 10, 13], [2, 5, 8, 11, 14]]

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