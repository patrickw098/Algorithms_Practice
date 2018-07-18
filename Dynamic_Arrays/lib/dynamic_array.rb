require_relative "static_array"

class DynamicArray
  attr_reader :length

  def initialize
    @store = StaticArray.new(8)
    @length = 0
    @start = 0
    @capacity = 8
  end

  # O(1)
  def [](index)
    if @length <= index
      raise "index out of bounds"
    else 
      @store[index]
    end
  end

  # O(1)
  def []=(index, value)
    @store[index] = value
  end

  # O(1)
  def pop
    raise "index out of bounds" if @length == 0
    @length -= 1
    el = @store[@length]

    el
  end

  # O(1) ammortized; O(n) worst case. Variable because of the possible
  # resize.
  def push(val)
    if @length < @capacity
      @store[@length] = val
      @length += 1
    else 
      self.resize!
      @store[@length] = val
      @length += 1
    end
  end

  # O(n): has to shift over all the elements.
  def shift
    raise "index out of bounds" if @length == 0
    el = @store[0]

    (0...@length).each do |index|
      @store[index] = @store[index + 1]
    end

    @length -= 1
    el
  end

  # O(n): has to shift over all the elements.
  def unshift(val)
    self.resize! if @length >= @capacity
      @length.downto(0) do |index|
        @store[index + 1] = @store[index]
      end

    @length += 1
    @store[0] = val
  end

  protected
  attr_accessor :capacity, :store
  attr_writer :length

  def check_index(index)
  end

  # O(n): has to copy over all the elements to the new store.
  def resize!
    new_arr = StaticArray.new(2 * @length)
    @capacity = 2 * @length

    (0...@length).each do |index|
      new_arr[index] = @store[index]
    end

    @store = new_arr
  end
end
