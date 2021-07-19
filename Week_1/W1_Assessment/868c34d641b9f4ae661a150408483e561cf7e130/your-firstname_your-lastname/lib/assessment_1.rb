# Define your methods here.

require "byebug"


def my_map!(arr, &b)
    arr.each.with_index do |n, idx|
        arr[idx] = b.call(n)
    end
    arr 
end

def two?(arr, &b)
    count = 0 
    arr.each do |i| 
        count += 1 if b.call(i)
    end
    count == 2
end

def nor_select(arr, p1, p2)
    arr.select do |i|
        i if !p1.call(i) && !p2.call(i)
    end   
end

def array_of_hash_sum(arr)
    arr.inject(0) do |acc, i|
        i.each do |k, v|
            acc +=v 
        end
        acc
    end
end

def slangify(str)
    vowel = "aeiou"

    str.split.each do |w|
        w.each_char.with_index do |c, i|
            if vowel.include?(c.downcase) 
                w[i] = "" 
                break
            end
        end
    end.join(" ")
end

def char_counter(str, *c)
    hash = Hash.new(0)

    c.each do |i| 
        hash[i] = 0
    end

    str.each_char do |i|
        if c.length == 0
            hash[i] += 1
        elsif hash.has_key?(i) 
            hash[i] += 1
        end 
    end
    hash
end