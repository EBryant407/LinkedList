class Node
  attr_accessor :value, :next_node

  def initialize(value, next_node=nil)
    @value = value
    @next_node = next_node
  end

  def add(value)
    if @next_node.nil?
      @next_node = Node.new(value)
    else
      @next_node.add(value)
    end
  end

  def pop(previous_node)
    if @next_node.nil?
      previous_node.next_node = nil
      return @value
    else
      @next_node.pop(self)
    end
  end

  def show(node)
    if node.next_node.nil?
      print "#{node.value} -> nil\n"
    else
      print "#{node.value} -> "
      node.show(node.next_node)
    end
  end
end

class LinkedList
  def initialize(value)
    @head = Node.new(value)
  end

  def get
    @head
  end

  def add(value)
    @head.add(value)
  end

  def pop
    @head.pop(@head)
  end

  def last_node
    last = @head
    while !last.next_node.nil?
      last = last.next_node
    end
    last
  end

  def show
    @head.show(@head)
  end
end

def reverse(node, previous_node)
  next_node = node.next_node
  node.next_node = previous_node
  if next_node
    reverse(next_node, node)
  else
    return node
  end
end

list = LinkedList.new(0)
list.add(1)
list.add(2)
list.add(3)
list.show

new_list = reverse(list.get, nil)
new_list.show(new_list)
