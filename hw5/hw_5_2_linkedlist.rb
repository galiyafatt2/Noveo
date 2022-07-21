load 'hw_5_2_node.rb' #класс Node в файле hw_5_2_node
class LinkedList
  attr_accessor :head

  def initialize
    @head = Node.new(nil, nil) #возможно можно было как-то создать head при добавлении первого элемента...
  end

  def append(value)
    current_node = head
    while current_node.next_node != nil
      current_node = current_node.next_node
    end
    current_node.next_node = Node.new(value, nil)
  end

  def append_after(val, after_val)
    current_node = head
    while current_node.value != val && current_node != nil
      current_node = current_node.next_node
    end
    new_node = Node.new(after_val, current_node.next_node)
    current_node.next_node = new_node
  end

  def delete(val)
    current_node = head
    while current_node.next_node.value != val && current_node != nil
      current_node = current_node.next_node
    end
    current_node.next_node = current_node.next_node.next_node
  end
  
  def find(val)
    current_node = head
    return nil if !current_node.next_node
    return current_node.value if current_node.value == val
    while current_node
      return current_node.value if current_node.value == val
      current_node = current_node.next_node
    end
  end

  def to_s
    str = '('
    current_node = head.next_node
    while current_node.next_node != nil
      str += current_node.value.to_s + ', '
      current_node = current_node.next_node
    end
    str += current_node.value.to_s + ')'
    str
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
