# There are many ways to implement these methods, feel free to add arguments 
# to methods as you see fit, or to create helper methods.
require_relative 'bst_node'
require 'byebug'

class BinarySearchTree
  attr_reader :root

  def initialize
    @root = nil
  end

  def insert(value)
    return @root = BSTNode.new(value) unless @root
    node = @root
    found = false

    until found
      if value > node.value 
        unless node.right
          node.right = BSTNode.new(value)
          node.right.parent = node
          found = true
        else 
          node = node.right
        end
      else 
        unless node.left
          node.left = BSTNode.new(value)
          node.left.parent = node
          found = true
        else 
          node = node.left
        end
      end
    end
  end

  def find(value, tree_node = @root)
    return nil if tree_node.nil?
    return tree_node if value === tree_node.value

    if value <= tree_node.value 
      return self.find(value, tree_node.left)
    elsif value > tree_node.value
      return self.find(value, tree_node.right)
    end

    nil
  end

  def delete(value)
    node = self.find(value)
    return nil if node.nil?

    if node == @root 
      if node.left
        max = maximum(node.left)
        self.delete(max.value)
        node.value = max.value
      elsif node.right 
        max = node.right
        self.delete(max.value)
        node.value = max.value 
      else 
        @root = nil
      end
      return
    end

    parent = node.parent

    if node.left && node.right 
      max = self.maximum(node.left)
      self.delete(max.value)
      node.value = max.value
    elsif node.right 
      if node.value > parent.value 
        parent.right = node.right 
      else
        parent.left = node.right
      end
    elsif node.left
      if node.value > parent.value 
        parent.right = node.left 
      else
        parent.left = node.left
      end
    else
      if node.value > parent.value 
        parent.right = nil 
      else
        parent.left = nil
      end
    end

  end

  # helper method for #delete:
  def maximum(tree_node = @root)
    return tree_node unless tree_node.right

    return maximum(tree_node.right)
  end

  def depth(tree_node = @root)
    return -1 if tree_node.nil?
    # return 0 if tree_node.right.nil? && tree_node.left.nil?

    left = depth(tree_node.left) + 1
    right = depth(tree_node.right) + 1
    
    return left > right ? left : right 
  end 

  def is_balanced?(tree_node = @root)
    return true if tree_node.nil?

    left = tree_node.left
    right = tree_node.right

    depth_left = depth(left)
    depth_right = depth(right)

    dif = (depth_left - depth_right).abs

    if dif > 1 
      return false
    end

    return is_balanced?(left) && is_balanced?(right)
  end

  def in_order_traversal(tree_node = @root, arr = [])
    return [] if tree_node.nil?
    return [tree_node.value] if tree_node.right.nil? && tree_node.left.nil?

    left = in_order_traversal(tree_node.left)
    right = in_order_traversal(tree_node.right)

    return left + [tree_node.value] + right
  end


  private
  # optional helper methods go here:

end
