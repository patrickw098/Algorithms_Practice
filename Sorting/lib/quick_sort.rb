class QuickSort
  # Quick sort has average case time complexity O(nlogn), but worst
  # case O(n**2).

  # Not in-place. Uses O(n) memory.
  def self.sort1(array)
    if array.length <= 1 
      return self
    end

    pivot = array[0];
    low = [];
    high = [];

    (1...array.length).each do |i|
      el = array[i]

      if el > pivot
        high.push(el)
      else 
        low.push(el)
      end
    end

    low.sort + [pivot] + high.sort 
  end

  # In-place.
  def self.sort2!(array, start = 0, length = array.length, &prc)
    prc ||= Proc.new { |x,y| x <=> y }

    return array if length <= 1
    
    start_idx = QuickSort.partition(array, start, length, &prc)
    
    QuickSort.sort2!(array, start, start_idx - start, &prc)
    QuickSort.sort2!(array, start_idx + 1, length - (start_idx + 1), &prc)
    
    array
  end

  def self.partition(array, start, length, &prc)
    prc ||= Proc.new { |x,y| x <=> y }

    pivot = array[start]

    # array[start], array[idx] = array[idx], array[start]
    partition = start + 1

    (partition...(start + length)).each do |i|
      el = array[i]

      if prc.call(el, pivot) == -1
        array[i], array[partition] = array[partition], array[i]
        partition += 1
      end
    end

    partition -= 1

    array[start], array[partition] = array[partition], array[start]

    partition
  end
end
