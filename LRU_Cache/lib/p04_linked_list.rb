class Node
  attr_accessor :key, :val, :next, :prev

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
    # optional but useful, connects previous node to next node
    # and removes self from list.
    @prev.next, @next.prev = @next, @prev
  end
end

class LinkedList
  include Enumerable

  def initialize
    @tail = Node.new
    @head = Node.new 
    @head.next = @tail
    @tail.prev = @head
  end

  def [](i)
    each_with_index { |node, j| return node if i == j }
    nil
  end

  def first
    @head.next
  end

  def last
    @tail.prev
  end

  def empty?
    @head.next == @tail
  end

  def get(key)
    self.each do |node|
      return node.val if node.key == key 
    end
  end

  def include?(key)
    self.each do |node|
      return true if node.key == key 
    end 

    false
  end

  def append(key, val)
    el = Node.new(key, val)
    prev = @tail.prev 
    prev.next, el.prev = el, prev
    @tail.prev, el.next = el, @tail
  end

  def update(key, val)
    self.each do |node|
      if node.key == key 
        node.val = val
      end
    end
  end

  def remove(key)
    self.each do |node|
      if node.key == key 
        node.remove 
      end
    end
  end

  def each(&prc)
    node = @head.next
    until node == @tail
      prc.call(node)
      node = node.next
    end
  end

  # uncomment when you have `each` working and `Enumerable` included
  def to_s
    inject([]) { |acc, node| acc << "[#{node.key}, #{node.val}]" }.join(", ")
  end
end
