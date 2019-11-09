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
end

class LinkedList
  def initialize(value)
    @head = Node.new(value)
  end

  def add(value)
    @head.add(value)
  end

  def pop
    @head.pop(@head)
  end
end

class Stack
    attr_reader :data

    def initialize
        @list = nil
    end

    def push(value)
        if @list.nil?
          @list = LinkedList.new(value)
        else
          @list.add(value)
        end
    end

    def pop
      @list.pop
    end

end

s = Stack.new
s.push(1)
s.push(2)
puts s.pop
puts s.pop