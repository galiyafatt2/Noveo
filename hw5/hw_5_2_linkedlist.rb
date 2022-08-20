require_relative 'hw_5_2_node.rb' #класс Node в файле hw_5_2_node

class LinkedList
  attr_reader :head

  def initialize
    @head = nil
  end

  def append(value)
    old_node = nil
    current_node = head
    while current_node != nil
      old_node = current_node
      current_node = current_node.next_node
    end
    current_node = Node.new(value, nil)
    old_node.next_node = current_node if old_node
    @head = current_node if head.nil?
  end

  def append_after(val, after_val)
    current_node = head
    while current_node != nil && current_node.value != val
      current_node = current_node.next_node
    end
    return if current_node.nil?
    
    new_node = Node.new(after_val, current_node.next_node)
    current_node.next_node = new_node
  end

  def delete(val)
    current_node = head
    while !current_node&.next_node.nil? && current_node&.next_node.value != val
      current_node = current_node.next_node
    end
    return if current_node&.next_node.nil?
    
    current_node.next_node = current_node.next_node.next_node
  end
  
  def find(val)
    current_node = head
    return nil if !current_node&.next_node
    return current_node.value if current_node.value == val
    while current_node
      return current_node.value if current_node.value == val
      current_node = current_node.next_node
    end
  end

  def to_s
    str = '('
    current_node = head
    while current_node&.next_node != nil
      str += "#{current_node}, "
      current_node = current_node.next_node
    end
    str + "#{current_node})"
  end
  
  #-> returns new list but current list stays without changes
  def reverse
    new_list = LinkedList.new
    cur = head
    until cur.nil?
      new_list.append(cur)
      cur = cur.next_node
    end
    new_list.reverse!
  end

  #-> current list with reversed node
  def reverse!
    @head = head.reverse_node
    self
  end
  
end

list = LinkedList.new
list.append(3)
list.append(5)
list.append(10)
puts list #=> (3, 5, 10)

list.append_after(3, 15)
puts list #=> (3, 15, 5, 10)
list.append_after(10, 25)
puts list #=> (3, 15, 5, 10, 25)

list.delete(10) 
puts list #=> (3, 15, 5, 25)
p list.find(25) #=> 25

puts list.reverse! #=> (25, 5, 15, 3)
puts list.reverse #=> (3, 15, 5, 25)
puts list #=> (25, 5, 15, 3)
