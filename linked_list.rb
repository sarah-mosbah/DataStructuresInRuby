class Node
  attr_reader :key
  attr_accessor :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    self.prev.next= self.next if self.prev
    self.next.prev= self.prev  if self.next
    self.next=nil
    self.prev=nil
    self
  end
end

class LinkedList
  include Enumerable

   attr_accessor :head, :tail
  def initialize
    @head=Node.new
    @tail=Node.new
    @head.next= @tail
    @tail.prev=@head
  end

  def [](i)
    each_with_index { |node, j| return node if i == j }
    nil
  end

  def first
  empty? ? nil :  @head.next
  end

  def last
   empty? ? nil : @tail.prev
  end

  def empty?
    @head.next==@tail
  end

  def get(key)
    each do |node|
     return node.val if node.key==key
    end
    nil
  end

  def include?(key)
    each { |node| return true if node.key==key}
    return false
  end

 
  def append(key, val)
    new_node = Node.new(key, val)
    @tail.prev.next = new_node
    new_node.prev = @tail.prev
    new_node.next =@tail
    self.tail.prev = new_node

    new_node
  end


  def update(key, val)
    return if empty?
    each do |node|
        if node.key==key
             node.val=val
             return node
        end
    end
  end

  def remove(key)
    each do |node|
      if node.key==key
        node.remove
        return node.val
      end
    end
    nil
  end

  def each
    node= @head.next
    until node==@tail
     yield node
     node= node.next
    end
  end

end
