require_relative 'todolist'
require_relative 'fake_progress_bar'

# Creates a new todo list
todo = TodoList.new('Skip Todo List')

# Add four new items
todo.add_item('Buy Absinthe')
todo.add_item('Buy Paula\'s Texas Orange')
todo.add_item('Buy Edelflower Liquor')
todo.add_item('Buy lemons')

# Print the list
todo.print_list

# Delete the first item
todo.delete_item(0)

# Print the list
todo.print_list

# Delete the second item
todo.delete_item(1)

# Print the list
todo.print_list

# Update the completion status of the first item to complete
todo.update_item(0,true)

# Print the list
todo.print_list

# Update the title of the list
todo.update_title('Linda\'s List')

# Print the list
todo.print_list

#print by status
status = TodoList.new('Make Drink for Wife')
status.add_item('Buy Bourbon')
status.add_item('Buy Domaine De Canton')
status.add_item('Buy Lemons')
status.add_item('Make Gold Rush')
status.add_item('Serve to wife on Deck')
status.update_item(1, true)
puts 'Delay to watch Spanish Grand Prix in Jerez'
progressbar = FakeProgressBar.new(50)
progressbar.increment
puts ''
status.update_item(2, true)
status.print_by_status
puts ''
puts 'Oops, forgot Bourbon. Back to Store.'
progressbar.reset(25)
progressbar.increment
puts ''
status.update_item(2, true)
status.update_item(0, true)
status.print_by_status
puts ''
puts 'Wait for wife to come home from work.'
progressbar.increment
status.update_item(3,true)
status.update_item(4,true)
status.print_by_status




