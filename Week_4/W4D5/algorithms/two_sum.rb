
# O(n^2)
def bad_two_sum?(arr, target)
    ans = []
    arr.each.with_index do |ele, i|
        arr.each.with_index do |el2, i2|
            if i != i2
                return true if ele + el2 == target
            end
        end
    end

    false
end


# O(nlogn + n(log n))
# O(nlogn)
def okay_two_sum?(arr,target)
    ans = arr.sort #O(nlogn)

    ans.each do |ele|
        temp = ans.shift
        dif = target-temp
        return true if bsearch(arr,dif) == true
    end
    false
end


def bsearch(arr, target)
    return false if arr.empty?

    mid = arr.length / 2
    if arr[mid] == target
        return true
    end
    left = arr.take(mid)
    right = arr.drop(mid+1)
    if arr[mid] > target
        bsearch(left, target)
    else
        bsearch(right, target)
    end

    false
end

#O(n)
def two_sum?(arr,target)
    hash = Hash.new(0)
    arr.each do |i|
        hash[i] += 1
    end

    hash.each do |k,v|
        dif = target - k
        hash.delete(k)
        return true if hash[dif] == 1
    end

    false
end

arr = [0, 1, 5, 7]
p two_sum?(arr, 6) # => should be true
p two_sum?(arr, 10) # => should be false