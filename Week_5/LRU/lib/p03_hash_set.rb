class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    resize! if @store.length <= @count
    if !self.include?(key)
      self[key] << key 
      @count += 1
      return true
    end
    false
  end

  def include?(key)
    self[key].include?(key)
  end

  def remove(key)
    self[key].each_with_index do |n, i|
      if n == key
        self[key].delete_at(i)
        @count -= 1
      end
  end
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num.hash % @store.length]
  end

  def num_buckets
    @store.length
  end

  def resize!
    res = Array.new(@store.length * 2) { Array.new }
    @store.each do |sub|
      sub.each do |i|
        res[i.hash % res.length] << i
      end
    end
    @store = res
  end
end
