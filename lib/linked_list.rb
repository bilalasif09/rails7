class Node
  attr_accessor :value, :next_node, :prev
  def initialize value, next_node = nil, prev = nil
    @value = value
    @next_node = next_node
    @prev = prev
  end
end
class LinkedList
  def initialize
    @head = nil
    @end = nil
  end
  def append value
    node = Node.new(value)
    if @head.nil?
      @head = node
    else
      if @head.next_node.nil?
        @head.next_node = node
      end
    end
    unless @end.nil?
      @end.next_node = node
    end
    prev = @end
    @end = node
    @end.prev = prev
  end
  def reverse
    last = true
    arr = []
    node = @end
    while last
      arr << node.value
      node = node.prev
      if node.nil?
        last = false
      end
    end
    arr
  end
  def as_list
    last = true
    arr = []
    node = @head
    while last
      arr << node.value
      node = node.next_node
      if node.nil?
        last = false
      end
    end
    arr
  end
end 