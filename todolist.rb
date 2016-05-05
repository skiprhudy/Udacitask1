require 'date'

ASC  = 0
DESC = 1

# Contains data and methods for an item in the TodoList class
# public methods:
# constructor takes a description of the item
# finished marks the item as done
# completed? is the item complete or not
# age get the age in seconds of the item (seconds is not good, but suffices
# for this project)
class Item
  attr_reader :description, :completed, :created, :created_str, :updated,
              :updated_str

  def initialize(description)
    @description = description
    @completed   = false
    @created     = DateTime.now
    @created_str = @created.strftime('%Y-%m-%d-%H:%M:%S.%L')
    @updated     = nil
    @updated_str = 'Not Complete Yet'
    @age         = nil
  end

  def finished
    @completed   = true
    @updated     = DateTime.now
    @age         = @updated.strftime('%s').to_i - @created.strftime('%s').to_i
    @updated_str = @updated.strftime('%Y-%m-%d-%H:%M:%S.%L')
  end

  def completed?
    @completed
  end

  def age
    now = DateTime.now.strftime('%s').to_i
    if completed?
      return @age
    end
    some_time = @created.strftime('%s').to_i
    now - some_time
  end
end

# TodoList is a class that offers the following:
# Title of list (set and update)
# Add an item (provide a name string)
# Update the item when finished
# Delete an item
# Print the items (prints all items and their status and age)
# Print by status (completed or not and age)
# Print by age (sorted ascending or descending according to how old the item is)
class TodoList
  attr_accessor :title, :items

  def initialize(title)
    @title = title
    @items = []
  end

  def add_item(item_description)
    item = Item.new(item_description)
    @items.push(item)
  end

  def update_item(num)
    item = @items[num]
    item.finished
  end

  def delete_item(num)
    @items.delete_at(num)
  end

  def update_title(new_title)
    @title = new_title
  end

  def print_list(items = nil)
    items ||= @items
    puts @title
    # note: using 'each' on the collection does not guarantee order i want ...
    # (in my tests anyway)
    for idx in 0..items.length-1 do
      item = items[idx]
      puts "#{idx}) #{item.description}, Complete: #{item.completed}"
      print "   (Created: #{item.created}, Completed: #{item.updated_str}"
      puts ", Age: #{item.age} secs)"
    end
    puts ''
  end

  def print_by_status
    completed  = []
    incomplete = []
    puts "\n#{title}"
    @items.each_with_index do |item, idx|
      data = { item: item, index: idx }
      if item.completed?
        completed << data
      else
        incomplete << data
      end
    end
    print_completed(completed)
    print_incomplete(incomplete)
  end

  def print_by_age(sort = ASC)
    ary = @items.sort { |a, b| a.age <=> b.age } if sort == ASC
    ary = @items.sort { |a, b| b.age <=> a.age } if sort == DESC
    print_list(ary)
  end

  private

  def print_completed(completed)
    puts 'Completed: '
    puts 'No tasks complete!' if completed.empty?
    completed.each do |complete|
      puts "#{complete[:index]}) #{complete[:item].description}, Age: #{complete[:item].age}"
    end
  end

  def print_incomplete(incompleted)
    puts "\nIncomplete:"
    puts 'All tasks complete!' if incompleted.empty?
    incompleted.each do |incomplete|
      puts "#{incomplete[:index]}) #{incomplete[:item].description}, Age: #{incomplete[:item].age}"
    end
  end
end

ASC.freeze
DESC.freeze
