class MaxIntSet
  def initialize(max)
    @max = max
    @store = Array.new(max)
  end

  def insert(num)
    raise "Out of bounds" if num > @max || num < 0
    @store[num] = true
  end

  def remove(num)
    raise "Out of bounds" if num > @max || num < 0
    @store[num] = nil
  end

  def include?(num)
    return true if @store[num]
    false 
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
  end

  def insert(num)
    bucket = self[num]
    bucket << num if bucket
  end

  def remove(num)
    self[num].delete(num)

  end

  def include?(num)
    self[num].include?(num) if self[num]
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    index = num % num_buckets
    @store[index]
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
    resize! if @count == num_buckets
    self[num].push(num) if self[num]
    @count += 1
  end

  def remove(num)
    self[num].delete(num)
  end

  def include?(num)
    self[num].include?(num) if self[num]
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    index = num % num_buckets 
    @store[index]
  end

  def num_buckets
    @store.length
  end

  def resize!
    new_size = 2 * num_buckets
    new_arr = Array.new(new_size) { Array.new }

    @store.each do |buckets|
      buckets.each do |el|
        new_arr[el % new_size].push(el)
      end
    end

    @store = new_arr
  end
end
