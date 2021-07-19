require "byebug"

def some?(arr, &b)
    arr.each{ |i| return true if b.call(i)}
    false
end

def exactly?(arr, n, &b)
    count = 0
    arr.each{ |i| count += 1 if b.call(i)}
    count == n
end

def filter_out(arr, &b)
    res = []
    arr.each{ |i| res << i if !b.call(i)}
    res
end

def at_least?(arr, n, &b) 
    count = 0 
    arr.each{ |i| count += 1 if b.call(i)}

    count >= n
end

def every?(arr, &b)
    arr.each{ |i| return false if !b.call(i)}
    true
end

def at_most?(arr, n, &b)
    count = 0 
    arr.each do |i|
        count += 1 if b.call(i)
        return false if count > n
    end
    true
end

def first_index(arr, &b)
    arr.each.with_index { |n, i| return i if b.call(n) }
    nil
end

def xnor_select(arr, p1, p2)
    arr.select do |i|
        first = p1.call(i)
        second = p2.call(i)
        if (first == false && second == false) || (first && second)
            i
        end
    end
end

def filter_out!(arr, &b)
    arr.each.with_index{ |i, idx| arr.delete_at(idx) if b.call(i)}
end

def multi_map(arr, n = 1, &b)
    res = []
    arr.each do |i|
        n.times do
            i = b.call(i)
        end
        res << i
    end
    res
end

def proctition(arr, &b)
    left = []
    right = []

    arr.each do |i|
        b.call(i)? left << i : right << i
    end

    left + right
end

def selected_map!(arr, p1, p2)
    arr.each_with_index do |n, i| 
        arr[i] = p2.call(n) if p1.call(n)
    end
    nil
end

def chain_map(v, arr)
    res = v 
    arr.each { |i| res = i.call(res)}
    res
end

def proc_suffix(str, hash) 
    res = []
    str.split().each do |word|
        res << word
        hash.each{ |k, v| res[-1] += v if k.call(word) }
    end
    res.join(" ")
end

def proctition_platinum(arr, *p)
    hash = Hash.new 
    c = 1
    p.length.times do 
        hash[c] = []
        c += 1
    end

    arr.each do |i| 
        p.each_with_index do |prc, idx|
            if prc.call(i) 
                hash[idx + 1] << i 
                break
            end
        end
    end
    hash 
end

def procipher(str, hash) 
    res = []

    str.split.each do |w|
        res << w
        hash.each { |k, v| res[-1] = v.call(res[-1]) if k.call(w) }
    end
    res.join(" ")
end

def picky_procipher(str, hash) 
    res = []

    str.split.each do |w|
        res << w
        hash.each do |k, v| 
            if k.call(w) 
                res[-1] = v.call(w) 
                break
            end
       end
    end
    res.join(" ")
end