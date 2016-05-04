
class Item
  attr_reader :description, :completed
  attr_writer :completed

  def initialize(description)
    @description = description
    @completed = false
  end

  def completed?
    @completed
  end
end

class TodoList

  attr_accessor :title, :items

  def initialize(title)
    @title = title
    @items = Array.new
  end

  def add_item(item_description)
    item = Item.new(item_description)
    @items.push(item)
  end

  def update_item(num,status)
    item = @items[num]
    item.completed = status
  end

  def delete_item(num)
    @items.delete_at(num)
  end

  def update_title(new_title)
    @title = new_title
  end

  def print_list
    puts "#{title}"
    @items.each_with_index do |item, x|
      puts "#{x}) #{item.description}, Complete: #{item.completed}"
    end
    puts ''
  end

  def print_by_status
    completed = Array.new
    incomplete = Array.new
    puts "#{title}"
    @items.each_with_index do | item, idx |
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

  private

  def print_completed(completed)
    puts 'Completed: '
		puts 'No tasks complete!' if completed.empty?
    completed.each do |complete|
      puts "#{complete[:index]}) #{complete[:item].description}"
    end
  end

  def print_incomplete(incomplete)
    puts "\nIncomplete:"
		puts 'All tasks complete!' if incomplete.empty?
    incomplete.each do |incomplete|
			puts "#{incomplete[:index]}) #{incomplete[:item].description}"
    end
  end

end
