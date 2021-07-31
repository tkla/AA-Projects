
# O(n^2)
def windowed_max_range(arr, window_size)
    max = 0
    (0..arr.length - window_size).each do |i|
        tmp = arr[i...i+window_size]
        sum = tmp.max - tmp.min
        max = sum if max < sum 
    end
    max 
end

# p windowed_max_range([1, 0, 2, 5, 4, 8], 3) == 5 # 0, 2, 5
# p windowed_max_range([1, 0, 2, 5, 4, 8], 2) == 4 # 4, 8
# p windowed_max_range([1, 0, 2, 5, 4, 8], 4) == 6 # 2, 5, 4, 8
# p windowed_max_range([1, 3, 2, 5, 4, 8], 5) == 6 # 3, 2, 5, 4, 8

# Ruby O(n + window_size ^ 2)
# O(n + window_size ^ 3)
def windowed_max_range_q(arr, window_size)
    max = 0
    q = arr[0...window_size]
    
    (window_size..arr.length).each do |i|
        sum = q.max - q.min       
        max = sum if max < sum 
        p q
        q.shift 
        q << arr[i]
    end
    # until arr.empty? && q.length != window_size
    #     sum = q.max - q.min 
    #     max = sum if max < sum 
        
    #     q.shift 
    #     break if arr.empty?
    #     q << arr.shift 
    # end

    max 
end

# p windowed_max_range_q([1, 0, 2, 5, 4, 8], 3)
# p windowed_max_range_q([1, 0, 2, 5, 4, 8], 2) 
# p windowed_max_range_q([1, 0, 2, 5, 4, 8], 4) 
# p windowed_max_range_q([1, 3, 2, 5, 4, 8], 5) 

#FILO
#O(n)
def windowed_max_range_s(arr, window_size)
    
end

    # stack = window_size.times MyStack.new

    # (0...arr.length).each |i|
    #     index = stack.length % i
    #     stack[index].pop
    #     stack[index].push(arr[i])
    # end

class MyQueue
    attr_accessor :store
    def initialize
        @stack1 = MyStack.new
        @stack2 = MyStack.new
        enqueue_last = false 
    end

    


    # def peek
    #     @store[0]
    # end

    # def size
    #     @store.length
    # end

    # def empty?
    #     @store.empty?
    # end

    # def enqueue(ele)
    #     @store.push(ele)
    # end

    # def dequeue
    #     @store.shift
    # end
end

class MyStack
    attr_accessor :store
    def initialize
        @store = []
    end
    def peek
        @store[-1]
    end
    def size
        @store.length
    end
    def empty?
        @store.empty?
    end
    def pop
        @store.pop
    end
    def push(ele)
        @store.push(ele)
    end
end

