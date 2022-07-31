class Node
  attr_reader :value
  attr_accessor :left, :right

  def initialize(value, left = nil, right = nil)
    @value = value
    @left = left
    @right = right
  end

  def add(other_value)
    if other_value < value
      left.nil? ? @left = Node.new(other_value) : left.add(other_value)
    elsif other_value > value
      right.nil? ? @right = Node.new(other_value) : right.add(other_value)
    end
  end
  
  def find(value, iter = self)
    return if iter.nil?
    return find(value, iter.left) if iter.value > value
    return find(value, iter.right) if iter.value < value

    value
  end

  def delete(value, iter = self)
    return iter if iter.nil?

    if iter.value > value
      iter.left = delete(value, iter.left)
    elsif iter.value < value
      iter.right = delete(value, iter.right)
    elsif !iter.left.nil? && !iter.right.nil?
      iter.value = minim(iter.right).value
      iter.right = delete(iter.value, iter.right)
    else
      iter = iter.left.nil? ? iter.right : iter.left
      return if iter.nil?
    end
    iter
  end

  def to_s(iter = self)
    return if iter.nil?

    to_s(iter.left) unless iter.left.nil?
    puts iter.value.to_s
    to_s(iter.right) unless iter.right.nil?
  end

  private

  def minim(iter = self)
    return if iter.nil?
    return iter if iter.left.nil?

    minim(iter.left)
  end
end
