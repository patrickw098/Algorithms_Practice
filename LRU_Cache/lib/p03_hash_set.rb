require_relative 'p02_hashing'

class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    resize! if @count == num_buckets
    @count += 1
    self[key].push(key)
  end

  def include?(key)
    self[key].include?(key) if self[key]

  end

  def remove(key)
    self[key].delete(key) if self[key]
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    hash = num.hash 
    index = hash % num_buckets 
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
        new_arr[el.hash % new_size].push(el)
      end
    end

    @store = new_arr
  end
end
