

def strange_sums(arr)
    count = 0

    arr.each.with_index do |n, i| 
        arr.each.with_index do |x, j|
            count += 1 if j > i && n + x == 0 
        end
    end
    return count
end

#p strange_sums([2, -3, 3, 4, -2])     # 2
#p strange_sums([42, 3, -1, -42])      # 1
#p strange_sums([-5, 5])               # 1
#p strange_sums([19, 6, -3, -20])      # 0
#p strange_sums([9])                   # 0

def pair_product(arr, num)

    arr.each.with_index do |n, i| 
        arr.each.with_index do |x, j|
            return true if j > i && n * x == num
        end
    end
    false
end

def rampant_repeats(str, hash)
    res = ""
    str.each_char do |c|
        if hash.has_key?(c) 
            hash[c].times{ res += c}
        else 
            res += c
        end
    end
    res
end

def perfect_square(n)
    (1..n).each do |i|
        return false if i*i > n
        return true if i * i == n
    end
end

p perfect_square(1)     # true
p perfect_square(4)     # true
p perfect_square(64)    # true
p perfect_square(100)   # true
p perfect_square(169)   # true
p perfect_square(2)     # false
p perfect_square(40)    # false
p perfect_square(32)    # false
p perfect_square(50)    # false