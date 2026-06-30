class LinkedList
  def initialize
    @head = nil
    @tail = nil
  end

  def append(value)
    new_node = Node.new(value)
    if @head.nil?
      @head = new_node
      @tail = new_node
    else
      @tail.next_node = new_node
      @tail = new_node
    end
  end

  def prepend(value)
    new_node = Node.new(value)
    if @head.nil?
      @head = new_node
      @tail = new_node
    else
      temp_node = @head
      @head = new_node
      @head.next_node = temp_node
    end
  end

  def size
    count = 0
    current = @head
    while current
      count = count + 1
      current = current.next_node
    end
    count
  end

  def head 
    if @head == nil
      return nil
    end
    @head.value
  end

  def tail 
    if @tail == nil
      return nil
    end
    @tail.value
  end

  def at(index)
    current = @head
    while index > 0 && current
      current = current.next_node
      index = index - 1
    end
    if current == nil
      return nil
    end
    current.value
  end

  def pop
    if @head == nil
      return nil
    end
    node = @head
    @head = @head.next_node
    if @head == nil
      @tail = nil
    end
    node.value
  end

  def contains?(value)
    current = @head
    while current
      if current.value == value
        return true
      end
      current = current.next_node
    end
    false
  end
end
