class LinkedList
  attr_accessor :head, :tail

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

  def head_val 
    if @head == nil
      return nil
    end
    @head.value
  end

  def tail_val 
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

  def index(value)
    current = @head
    index = 0
    while current
      if current.value == value
        return index
      end
      index = index + 1
      current = current.next_node
    end
    nil
  end

  def to_s
    string = ''
    current = @head
    while current
      string.concat("( #{current.value} ) -> ")
      current = current.next_node
      if current == nil
        string.concat('nil')
      end
    end
    string
  end

  def insert_at(index, *values)
    return if values.empty?
    list_size = self.size

    if index < 0
      raise IndexError, "Index #{index} is out of bounds!"
    end
    if index > list_size
      raise IndexError, "Index #{index} is out of bounds!"
    end

    new_list = LinkedList.new()
    values.each do |value|
      new_list.append(value)
    end

    if index == 0
      if @tail.nil?
        @head = new_list.head
        @tail = new_list.tail
      else
        new_list.tail.next_node = @head
        @head = new_list.head
      end
      return
    elsif index == list_size
      @tail.next_node = new_list.head
      @tail = new_list.tail 
      return
    end

    count = 0
    current = @head
    previous = nil
    while count != index && current.next_node
      previous = current
      current = current.next_node
      count = count + 1
    end
    
    previous.next_node = new_list.head
    new_list.tail.next_node = current
  end
end
