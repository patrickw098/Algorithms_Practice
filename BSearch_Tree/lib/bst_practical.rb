
def kth_largest(tree_node, k)
    return [] if tree_node.nil?
    # return [tree_node] if tree_node.left.nil? && tree_node.right.nil?

    right = kth_largest(tree_node.right, k)
    return right unless right.kind_of?(Array)

    left = kth_largest(tree_node.left, k) 
    return left unless left.kind_of?(Array)

    arr = left + [tree_node] + right

    if arr.length >= k 
        return arr[arr.length - k]
    else 
        return arr
    end
end
