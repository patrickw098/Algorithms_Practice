require_relative "static_array"

class RingBuffer
  attr_reader :length

  def initialize
    @store = StaticArray.new(8)
    @length = 0
    @start_idx = 0
    @capacity = 8
  end

  # O(1)
  def [](index)
    if @length <= index
      raise "index out of bounds"
    else 
      @store[(@start_idx + index) % @capacity]
    end
  end

  # O(1)
  def []=(index, val)
    if @length <= index 
      raise "index out of bounds"
    end
     @store[(index + @start_idx) % @capacity] = val
  end

  # O(1)
  def pop
    raise "index out of bounds" if @length == 0 
    @length -= 1
    @store[(@start_idx + @length) % @capacity]
  end

  # O(1) ammortized
  def push(val)
    if @length < @capacity
      @store[(@start_idx + @length) % @capacity] = val
      @length += 1
    else 
      self.resize!
      @store[(@start_idx + @length) % @capacity] = val
      @length += 1
    end
  end

  # O(1)
  def shift
    raise "index out of bounds" if @length == 0 
    el = @store[(@start_idx + @capacity) % @capacity]
    @start_idx += 1
    @length -= 1
    el
  end

  # O(1) ammortized
  def unshift(val)
    if @length < @capacity
      @start_idx -= 1
      @store[(@start_idx + @capacity) % @capacity] = val
      @length += 1    
    else 
      self.resize!
      @start_idx -= 1
      @store[(@start_idx + @capacity) % @capacity] = val
      @length += 1
    end
  end

  protected
  attr_accessor :capacity, :start_idx, :store
  attr_writer :length

  def check_index(index)
    index % @capacity
  end

  def resize!
    new_arr = StaticArray.new(2 * @length)
    old_cap = @capacity
    @capacity = 2 * @length


    if @start_idx < 1 
      ((@start_idx + old_cap) % old_cap...old_cap).each do |index|
        new_arr[index + @length] = @store[index]
      end
    end

    (0...(@start_idx + @length) % @capacity).each do |index|
      new_arr[index] = @store[index]
    end

    @store = new_arr
  end
end
