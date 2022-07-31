require_relative 'hw_6_1_node'

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

  def find(value)
    @root.find(value)
  end

  def delete_val(value)
    @root.delete(value)
  end

  def to_s(iter = root)
    @root.to_s
  end

end

tree = BinaryTree.new

tree.add(10) #=> 10
tree.add(20) #=> 20
tree.add(30) #=> 30

tree.delete_val(30)
tree.delete_val(25)

p tree.find(20) #=> 20
p tree.find(26) #=> nil
puts tree #=> 10 20
