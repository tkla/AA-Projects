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


end


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

a = [1, 2, 3]
p a.my_select { |num| num > 1 } # => [2, 3]
p a.my_select { |num| num == 4 } # => []