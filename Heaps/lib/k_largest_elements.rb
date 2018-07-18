require_relative 'heap'

def k_largest_elements(array, k)
    prc = Proc.new { |el1, el2| -1 * ( el1 <=> el2 ) }

    arr = []
    
    until arr.length == k
        sorted_length = 1

        until sorted_length == array.length + 1
            BinaryMinHeap.heapify_up(array, sorted_length - 1, sorted_length, &prc)

            sorted_length += 1
        end

        arr << array.shift
    end

    arr
end
