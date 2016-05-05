require 'date'

ASC = 0
DESC = 1

class Item
  attr_reader :description, :completed, :created, :created_str, :updated, :updated_str

  def initialize(description)
    @description = description
    @completed = false
		@created = DateTime.now
		@created_str = @created.strftime('%Y-%m-%d-%H:%M:%S.%L')
		@updated = nil
		@updated_str = 'Not Complete Yet'
	end

	def finished
		@completed = true
		@updated = DateTime.now
		@age = @updated.strftime('%s').to_i
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
		age = now - some_time
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

  def print_list(items = nil)
		items ||= @items
    puts "#{title}"
    @items.each_with_index do |item, x|
      puts "#{x}) #{item.description}, Complete: #{item.completed}"
			print "   (Created: #{item.created}, Completed: #{item.updated_str} "
			puts "Age: #{item.age})"
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

	def print_by_age(sort = ASC)
		ary = @items.sort { |a,b| a.age <=> b.age } if sort == ASC
		ary = @items.sort { |a,b| b.age <=> a.age } if sort == DESC
		print_list(ary)
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

ASC.freeze
DESC.freeze