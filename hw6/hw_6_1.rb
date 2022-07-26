require_relative '6_1_node'

class BinaryTree
  attr_accessor :root

  def initialize
    @root = nil
  end

  def add(value)
    if root.nil?
      @root = Node.new(value)
    else
      @root.add(value)
    end
  end

  def find(value, iter = root)
    return if iter.nil?

    return find(value, iter.left) if iter.value > value
    return find(value, iter.right) if iter.value < value

    value
  end

  def delete_val(value, iter = root)
    return iter if iter.nil?

    if iter.value > value
      iter.left = delete_val(value, iter.left)
    elsif iter.value < value
      iter.right = delete_val(value, iter.right)
    elsif !iter.left.nil? && !iter.right.nil?
      iter.value = minim(iter.right).value
      iter.right = delete_val(iter.value, iter.right)
    else
      iter = iter.left.nil? ? iter.right : iter.left
      return if iter.nil?
    end
    iter
  end

  def minim(iter = root)
    return if iter.nil?
    return iter if iter.left.nil?

    minim(iter.left)
  end

  def to_s(iter = root)
    return if iter.nil?

    to_s(iter.left) unless iter.left.nil?
    puts iter.value.to_s
    to_s(iter.right) unless iter.right.nil?
  end

end

tree = BinaryTree.new

tree.add(10) #=> 10
tree.add(20) #=> 20
tree.add(30) #=> 30

tree.delete_val(10)
tree.delete_val(25)

p tree.find(20) #=> 20
p tree.find(26) #=> nil
puts tree #=> 10 20 30
