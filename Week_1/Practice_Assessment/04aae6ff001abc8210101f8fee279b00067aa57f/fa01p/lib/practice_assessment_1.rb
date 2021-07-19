# Define your methods here. 

require "byebug"

def first_letter_vowel_count(str)

    vowel = "aeiou"
    count = 0
    str.split.each do |w|
        count += 1 if vowel.include?(w[0].downcase) 
    end
    count
end

def count_true(arr, p)
    arr.inject(0) do |acc, i|
        if p.call(i)
            acc += 1
        else
            acc
        end
    end
end

def procformation(arr, p1, p2, p3)
    #Check p1, if (p1) do p2 else do p3
    arr.map do |i|
        p1.call(i)? p2.call(i) : p3.call(i)
    end
end

def array_of_array_sum(arr)
    arr.inject(0) { |acc, i| acc += i.sum }
end

def selective_reverse(str)
    res = str.split

    res.each_with_index do |w, i|
        res[i] = w.reverse if !"aeiou".include?(w[0].downcase) && !"aeiou".include?(w[-1].downcase)
    end
    res.join(" ")
end

def hash_missing_keys(hash, *args)
    return args if args.length == 0

    args.select do |i|
        i if !hash.has_key?(i) 
    end
end