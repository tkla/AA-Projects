def rec_range(start, last)
    return [] if last < start 
    return [last] if start == last 

    res = [start]
    res += rec_range(start + 1, last)
end

def iter_range(start, last)
    return [] if last < start 
    res = []
    while start <= last 
        res << start 
        start += 1
    end 
    res
end

# p iter_range(6, 5)
# p iter_range(1, 5)
# p iter_range(-1, 5)

def exp1(base, n)
    return 1 if n == 0 

    base * exp1(base, n-1)
end

def exp2(base, n)
    return 1 if n == 0 
    return base if n == 1 

    if n % 2 == 0 
        t = exp2(base, n/2) 
        t *= t
    else 
        half_power = (n-1) / 2
        t = exp2(base, half_power)
        t *= t
        t = base * t
    end
    t
end
# p exp2(2, 6)
# p exp2(3, 2)
# p exp2(2, 2)
# p exp2(7, 1)
# p exp2(7, 0)
# p exp2(2, 7)

def deep_dup(arr)
    return [arr] if !arr.is_a?(Array)
    res = []
    arr.each do |a|
        res += deep_dup(a)
    end 
    res 
end

# a = [1, [2], [3, [4,5,6,[7,8,9]]]]
# p deep_dup(a)

def r_fib(n)
    return [1] if n == 1 
    return [1,1] if n == 2
    res = r_fib(n-1)
    res << res[-1] + res[-2]
end

#p r_fib(6)

def bsearch(arr, target)
    if arr.length == 1 
        if arr[0] == target 
            return 0
        else 
            return nil
        end
    end 

    half = arr.length/2 

    if arr[half] == target 
        return half 
    elsif arr[half] < target 
        right_half = bsearch(arr[half..-1], target)
        if right_half != nil 
            return half + right_half
        else 
            return nil 
        end 
    else
        left_half = bsearch(arr[0...half], target)
        if left_half != nil 
            return left_half 
        else 
            return nil 
        end 
    end 
end 

# p bsearch([1, 2, 3], 1) # => 0
# p bsearch([2, 3, 4, 5], 3) # => 1
# p bsearch([2, 4, 6, 8, 10], 6) # => 2
# p bsearch([1, 3, 4, 5, 9], 5) # => 3
# p bsearch([1, 2, 3, 4, 5, 6], 6) # => 5
# p bsearch([1, 2, 3, 4, 5, 6], 0) # => nil
# p bsearch([1, 2, 3, 4, 5, 7], 6) # => nil

def merge(arr1, arr2)
    arr = [] 

    (arr2.length > arr1.length)? max = arr2.length : max = arr1.length
    a1_idx = 0
    a2_idx = 0 
    while a1_idx < max || a2_idx < max 
        if arr2[a2_idx] == nil 
            arr += arr1[a1_idx..-1] 
            break 
        elsif arr1[a1_idx] == nil 
            arr += arr2[a2_idx..-1] 
            break 
        end 

        a1 = arr1[a1_idx]
        a2 = arr2[a2_idx]

        if a1 < a2 
            arr << a1
            a1_idx += 1 
            
        else 
            arr << a2
            a2_idx += 1 
        end
    end
    arr
end

def merge_sort(arr)
    return arr if arr.length < 2 

    half = arr.length/2 

    left_half = arr[0...half]
    right_half = arr[half..-1]


    merge(merge_sort(left_half), merge_sort(right_half))
end

#p merge([1], [0])
# p merge_sort([1,0])
# p merge_sort([3,2,1])
# p merge_sort([3,2,1, 7, 567, 5, 3, -1, 4, 23, 3, 11, 32, 4, -12, 0 ,34, 7])

def subsets(arr)
    res = [] 
    if arr.length == 1 
        res << [] 
        res << [arr[0]]
        return res 
    elsif arr.empty?
        return [[]]
    end
    
    last = arr.pop 
    old_set = subsets(arr)
    res += old_set
    
    old_set.each do |i| 
        new_perm = i + [last]
        res << new_perm 
    end
    res 
end

p subsets([]) # => [[]]
p subsets([1]) # => [[], [1]]
p subsets([1, 2]) # => [[], [1], [2], [1, 2]]
p subsets([1, 2, 3])
# => [[], [1], [2], [1, 2], [3], [1, 3], [2, 3], [1, 2, 3]]