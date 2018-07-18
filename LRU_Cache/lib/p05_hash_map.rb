require_relative 'p02_hashing'
require_relative 'p04_linked_list'

class HashMap
  include Enumerable
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { LinkedList.new }
    @count = 0
  end

  def include?(key)
    bucket = bucket(key)
    bucket.include?(key)
  end

  def set(key, val)
    bucket = bucket(key)
    if bucket.include?(key) 
      bucket.update(key, val)
    else 
      resize! if @count == num_buckets
      bucket.append(key, val)
      @count += 1 
    end
  end

  def get(key)
    bucket = bucket(key)
    bucket.get(key)
  end

  def delete(key)
    bucket = bucket(key)
    bucket.remove(key)
    @count -= 1
  end

  def each(&prc)
    @store.each do |buckets|
      buckets.each do |node|
        yield [node.key, node.val]
      end
    end
  end

  # uncomment when you have Enumerable included
  def to_s
    pairs = inject([]) do |strs, (k, v)|
      strs << "#{k.to_s} => #{v.to_s}"
    end
    "{\n" + pairs.join(",\n") + "\n}"
  end

  alias_method :[], :get
  alias_method :[]=, :set

  private

  def num_buckets
    @store.length
  end

  def resize!
    new_size = 2 * num_buckets
    new_arr = Array.new(new_size) { LinkedList.new }

    @store.each do |buckets|
      buckets.each do |node|
        new_arr[node.key.hash % new_size].append(node.key, node.val)
      end
    end

    @store = new_arr
  end

  def bucket(key)
    # optional but useful; return the bucket corresponding to `key`
    hash = key.hash 
    @store[hash % num_buckets]
  end
end
