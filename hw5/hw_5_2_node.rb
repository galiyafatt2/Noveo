class Node
  attr_accessor :value, :next_node
  def initialize (value, next_node)
      @value = value
      @next_node = next_node
  end

  def reverse_node(cur = self)
    return cur if cur&.next_node.nil?

    new_node = reverse_node(cur.next_node)
    cur.next_node.next_node = cur
    cur.next_node = nil
    new_node
  end
  
  def to_s
    value.to_s
  end

end
