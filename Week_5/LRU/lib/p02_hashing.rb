class Integer
  # Integer#hash already implemented for you
end

class Array
  def hash
    arr_hash = 0 
    self.each_with_index do |elem, i| 
      arr_hash ^= elem.to_i.hash + i 
    end

    arr_hash 
  end
end

class String
  def hash
    str_hash = 0 
    res = self.split("")

    res.each_with_index do |char, i| 
      str_hash ^= char.ord.hash + i 
    end
    str_hash 
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    hash_hash = 0 
    self.keys.each do |k| 
      hash_hash ^= k.hash + self[k].hash
    end 
    hash_hash 
  end
end
