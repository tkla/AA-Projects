#O(n!)
def anagram_factorial?(str1, str2)
    perms = str1.split("").permutation.to_a
    perms.include?(str2.split(""))
end

# p anagram_factorial?("gizmo", "sally")    #=> false
# p anagram_factorial?("elvis", "lives")    #=> true

#O(n^2)
def anagram_sq?(str1, str2)
    char = str2.split("")
    str1.each_char do |c| 
        i = char.find_index(c) 
        return false if i == nil
        char.delete_at(i)
    end

    char.empty?
end

#O(nlogn)
def anagram_nlogn?(str1, str2)
    str1.chars.sort.join == str2.chars.sort.join 
end

# p anagram_nlogn?("gizmo", "sally")    #=> false
# p anagram_nlogn?("elvis", "lives")    #=> true


# O(n)
# O(1) space, only hash of 26 chars in alphabet.
def anagram_n?(str1, str2)
    hash1 = Hash.new(0)
    hash2 = Hash.new(0)

    str1.each_char do |c|
        hash1[c] += 1
    end 

    str2.each_char do |c|
        hash2[c] += 1
    end 

    hash1 == hash2
end 

p anagram_n?("gizmo", "sally")    #=> false
p anagram_n?("elvis", "lives")    #=> true