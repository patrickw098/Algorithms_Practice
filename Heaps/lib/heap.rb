class BinaryMinHeap
  attr_reader :store, :prc

  def initialize(&prc)
    @prc = prc || Proc.new { |el1, el2| el1 <=> el2 }
    @store = []
  end

  def count
    @store.length
  end

  def extract
    @store[0], @store[-1] = @store[-1], @store[0]
    last = @store.pop

    BinaryMinHeap.heapify_down(@store, 0, @store.length, &@prc)

    last
  end

  def peek
    @store[0]
  end

  def push(val)
    @store.push(val)
    idx = @store.length - 1

    BinaryMinHeap.heapify_up(@store, idx, @store.length, &@prc)
  end

  public
  def self.child_indices(len, parent_index)
    idx1 = parent_index * 2 + 1
    idx2 = parent_index * 2 + 2
    indexes = []

    indexes.push(idx1) if idx1 < len 
    indexes.push(idx2) if idx2 < len 

    indexes
  end

  def self.parent_index(child_index)
    parent = ( child_index - 1 ) / 2

    raise "root has no parent" if parent < 0 

    parent
  end

  def self.heapify_down(array, parent_idx, len = array.length, &prc)
    children = BinaryMinHeap.child_indices(len, parent_idx)
    if children.empty?
      return array
    end
    
    prc = prc || Proc.new{ |a,b| a <=> b }
    boolean = prc.call(array[children[0]],array[children[1]]) if children.length == 2

    if boolean == 1 
      min = children[1]
    else 
      min = children[0]
    end

    boolean2 = prc.call(array[parent_idx], array[min]) 

    if boolean2 == 1 
      array[parent_idx], array[min] = array[min], array[parent_idx]
      BinaryMinHeap.heapify_down(array, min, len, &prc)
    else 
      return array
    end

  end

  def self.heapify_up(array, child_idx, len = array.length, &prc)
    return array if child_idx == 0

    prc = prc || Proc.new{ |a,b| a <=> b }
    parent = BinaryMinHeap.parent_index(child_idx)

    boolean = prc.call(array[parent], array[child_idx])

    if boolean == 1 
      array[parent], array[child_idx] = array[child_idx], array[parent]
      BinaryMinHeap.heapify_up(array, parent, len, &prc)
    else 
      return array
    end
  end
end
