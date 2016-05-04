require 'date'

class Item
  attr_reader :description, :completed, :created, :created_str, :updated, :updated_str, :age

  def initialize(description)
    @description = description
    @completed = false
		@created = DateTime.now
		@created_str = @created.strftime('%Y-%m-%d-%H:%M:%S.%L')
		@updated = nil
		@updated_str = 'Not Complete Yet'
		@age = nil
	end

	def finished
		@completed = true
		@updated = DateTime.now
		@age = @updated
		@updated_str = @updated.strftime('%Y-%m-%d-%H:%M:%S.%L')
	end

  def completed?
    @completed
	end

	def age
		now = DateTime.now
		if completed?
			@age
		end
		@age = now - @created
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

  def print_list
    puts "#{title}"
    @items.each_with_index do |item, x|
      puts "#{x}) #{item.description}, Complete: #{item.completed}\n   (Created: #{item.created}, Completed: #{item.updated_str})"
    end
    puts ''
  end

  def print_by_status
    completed = Array.new
    incomplete = Array.new
    puts "\n#{title}"
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

  def print_incomplete(incompleted)
    puts "\nIncomplete:"
		puts 'All tasks complete!' if incompleted.empty?
    incompleted.each do |incomplete|
			puts "#{incomplete[:index]}) #{incomplete[:item].description}"
    end
  end

end
