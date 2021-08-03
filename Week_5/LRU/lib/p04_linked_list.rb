class Node
  attr_reader :key
  attr_accessor :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    # optional but useful, connects previous link to next link
    # and removes self from list.
  end
end

class LinkedList
  include Enumerable 
  attr_reader :first, :last 
  def initialize
    @head = Node.new
    @tail = Node.new
    @head.next = @tail
    @tail.prev = @head
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    @head.next 
  end

  def last
    @tail.prev 
  end

  def empty?
    @tail.prev == @head 
  end

  def get(key)
    start_node = @head.next 

    while start_node != @tail 
      if start_node.key == key 
        return start_node.val 
        break
      end 
      start_node = start_node.next 
    end
  end

  def include?(key)
    start_node = @head.next 

    while start_node != @tail 
      return true if start_node.key == key 
      start_node = start_node.next 
    end
    false 
  end

  def append(key, val)
    last_node = @tail.prev 
    new_node = Node.new(key, val)

    #Update last_node 
    last_node.next = new_node 
    
    #Update new_node 
    new_node.next = @tail 
    new_node.prev = last_node 

    #Update tail 
    @tail.prev = new_node
  end

  def update(key, val)
    start_node = @head.next 

    while start_node != @tail 
      if start_node.key == key 
        start_node.val = val 
        break
      end 
      start_node = start_node.next 
    end

  end

  def remove(key)
    start_node = @head.next 

    while start_node != @tail 
      if start_node.key == key 
        next_node = start_node.next 
        prev_node = start_node.prev 

        next_node.prev = prev_node
        prev_node.next = next_node

        break
      end 
      start_node = start_node.next 
    end
  end

  def each
    start_node = @head.next 

    while start_node != @tail 
      yield(start_node)
      start_node = start_node.next 
    end
  end

  #uncomment when you have `each` working and `Enumerable` included
  def to_s
    inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  end
end
