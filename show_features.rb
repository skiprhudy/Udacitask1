require_relative 'fake_progress_bar'

def demo_print_by_status
	status = TodoList.new('Make Drink for Wife')
	status.add_item('Buy Bourbon')
	status.add_item('Buy Domaine De Canton')
	status.add_item('Buy Lemons')
	status.add_item('Make Gold Rush')
	status.add_item('Serve to wife on Deck')
	status.update_item(1)
	puts 'Delay to watch Spanish MotoGP in Jerez'
	progressbar = FakeProgressBar.new(50)
	progressbar.increment
	puts ''
	status.update_item(2)
	status.print_by_status
	puts ''
	puts 'Oops, forgot Bourbon. Back to Store.'
	progressbar.reset(25)
	progressbar.increment
	puts ''
	status.update_item(2)
	status.update_item(0)
	status.print_by_status
	puts ''
	puts 'Wait for wife to come home from work.'
	progressbar.increment
	status.update_item(3)
	status.update_item(4)
	status.print_by_status
end

def demo_print_by_age
	#print by age, descending (oldest first)

	#print by age, ascending (newest first)
end
