require_relative 'todolist'

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
todo.print_by_status

