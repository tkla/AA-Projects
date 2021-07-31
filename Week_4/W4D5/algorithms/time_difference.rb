def my_min_o_nsq(arr) #O(n^2)
    min = arr[0]
    arr.each do |ele|
        arr.each do |el2|
            if min > el2
                min = el2
            end
        end
    end
    min
end

def my_min_on(arr) #O(n)
    min = arr[0]
    arr.each do |ele|
        if min > ele
            min = ele
        end
    end
    min
end

def my_min(arr) #O(nlogn)
    return arr.sort[0]
end

list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
# prints "my_min running time O(n), Can be O(nlogn) using ruby's sort"
p my_min(list)

def largest_contiguous_subsum_onsq(arr) #O(n^3)
    subarr = []

    (0...arr.length-1).each do |i|
        (i..arr.length).each do |j|
            subarr << [arr[i..j]]
        end
    end

    max = subarr.max
    max[0].sum
end


def largest_contiguous_subsum(arr)
    max_sum = arr[0]
    temp_sum = arr[0]

    arr[1..-1].each do |ele|
        temp_sum = 0 if temp_sum < 0
        temp_sum += ele 
        max_sum = temp_sum if temp_sum > max_sum
    end

    # arr[1..-1].each do |ele|
    #     temp_sum = 0 if temp_sum < 0 
    #         max_sum = temp_sum if max_sum < temp_sum
    #     else
    #         temp_sum += ele
    #     end
    # end
    max_sum
end


arr_n = [-5, -1, -3]
arr = [2, 3, -6, 7, -6, 7]
# prints "Largest Contiguous Subsum running time O(n)."
p largest_contiguous_subsum(arr_n)