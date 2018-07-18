require_relative "heap"

class Array
  def heap_sort!
    prc = Proc.new { |el1, el2| -1 * (el1 <=> el2) }

    heap_length = 1

    #heapify 
    until heap_length == self.length + 1
      BinaryMinHeap.heapify_up(self, heap_length - 1, heap_length, &prc)

      heap_length += 1
    end 

    
    #sort
    sorted_length = self.length - 1
    
    until sorted_length == 0
      self[0], self[sorted_length] = self[sorted_length], self[0]
      
      BinaryMinHeap.heapify_down(self, 0, sorted_length, &prc)
      sorted_length -= 1
    end

    self
  end
end
