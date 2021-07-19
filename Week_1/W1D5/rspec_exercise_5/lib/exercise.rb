require "byebug"

def zip(*arrs)
    res = []

    arrs.each do |i|
        i.each_with_index do |a, idx|
            if res[idx] == nil
                res << [a]
            else
                res[idx] << a
            end
        end
    end
    res
end

def prizz_proc(a, p1, p2)
    a.select { |i| i if p1.call(i) ^ p2.call(i)}
end

def zany_zip(*arrs) 
    row = arrs.max_by(&:length).length 
    col = arrs.length

    res = Array.new(row){ Array.new(col, nil)}

    arrs.each_with_index do |n, i| 
        n.each_with_index { |x, j| res[j][i] = x }
    end
    res
end

def maximum(arr, &b)
    return nil if arr.length == 0
    arr.reverse.max_by { |i| b.call(i)}
end

def my_group_by(arr, &b)
    hash = Hash.new{ |h, k| h[k] = [] }

    arr.each{ |i|  hash[b.call(i)] << i }
    hash 
end

def max_tie_breaker(arr, p, &b)
    return nil if arr.length == 0 

    max = b.call(arr[0])
    max_idx = 0
    arr.each_with_index do |i, idx| 
        curr = b.call(i)
        max, max_idx = curr, idx  if max < curr
        if max == curr
            tiebreak = p.call(i)
            tmp = p.call(arr[max_idx])
            max, max_idx = curr, idx if tmp < tiebreak 
        end
    end
    arr[max_idx] 
end

def silly_syllables(str)
    vowel = "aeiou"
    
    res = []

    str.split.each do |w| 
        first = 0
        last = 0

        w.each_char.with_index do |c, i|
            if vowel.include?(c.downcase)
                first = i 
                break
            end 
        end

        w.reverse.each_char.with_index do |c, i|
            if vowel.include?(c.downcase)
                last = w.length - 1 - i 
                break
            end 
        end

        first == last ? res << w : res << w[first..last]
    end

    res.join(" ")
end