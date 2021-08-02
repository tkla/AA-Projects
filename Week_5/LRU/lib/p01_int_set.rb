class MaxIntSet
  attr_reader :store 

  def initialize(max)
    @max = max 
    @store = Array.new(@max, false) 
  end

  def insert(num)
    raise "Out of bounds" if num > @max || num < 0 
    @store[num] = true 
  end

  def remove(num)
    @store[num] = false 
  end

  def include?(num)
    @store[num]
  end

  private

  def is_valid?(num)
  end

  def validate!(num)
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @num_buckets = num_buckets
  end

  def insert(num)
    return false if self.include?(num)
    self[num] << num
    return true
  end

  def remove(num)
    self[num].each_with_index do |n, i|
        if n == num
          self[num].delete_at(i)
        end
    end
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num % num_buckets]
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    resize! if @store.length <= @count
    if !self.include?(num)
      self[num] << num 
      @count += 1
      return true
    end
    false
  end

  def remove(num)
    self[num].each_with_index do |n, i|
      if n == num
        self[num].delete_at(i) 
        @count -= 1
      end
    end
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num % @store.length]
  end

  def num_buckets
    @store.length
  end

  def resize!
    res = Array.new(@store.length * 2) { Array.new }
    @store.each do |sub|
      sub.each do |i|
        res[i % res.length] << i
      end
    end
    @store = res
  end
end
