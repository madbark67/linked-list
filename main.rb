require_relative 'LinkedList'

list = LinkedList.new
list.append('dog')
list.append('cat')
list.append('parrot')
list.append('hamster')
list.append('snake')
list.append('turtle')

list.prepend('test')


puts list
puts list.size
puts list.head_val
puts list.tail_val
puts list.at(1)
puts list.pop
puts list
puts list.contains?('turtle')
puts list.contains?('nope')
puts list.index('turtle')

list.insert_at(1,'chicken','pig')
puts list
list.remove_at(1)
puts list