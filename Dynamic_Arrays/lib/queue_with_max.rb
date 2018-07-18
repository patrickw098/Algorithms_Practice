# Implement a queue with #enqueue and #dequeue, as well as a #max API,
# a method which returns the maximum element still in the queue. This
# is trivial to do by spending O(n) time upon dequeuing.
# Can you do it in O(1) amortized? Maybe use an auxiliary storage structure?

# Use your RingBuffer to achieve optimal shifts! Write any additional
# methods you need.

require_relative 'ring_buffer'

class QueueWithMax
  attr_accessor :store

  def initialize
    @store = RingBuffer.new
    @max = []
  end

  def enqueue(val)
    if @max.length == 0
      @max.unshift(val)
    elsif val > @max[-1]
      length = @max.length - 1
      length.downto(0) do |index|
        if @max[index] < val
          @max = @max.take(index)
          @max.push(val)
        end
      end
    else 
      @max.push(val)
    end

    @store.push(val)
  end

  def dequeue
    el = @store.shift
    
    if @max.length > 0 && el == @max[0]
      @max.shift
    end 

  end

  def max
    @max[0]
  end

  def length
    @store.length
  end

end
