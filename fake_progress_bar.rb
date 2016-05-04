class FakeProgressBar

	def initialize(len, wait_time = 0.1, symbol = '*')
		@length = len
		@wait_time = wait_time
		@symbol = symbol
	end

	def reset(len, wait_time = 0.1, symbol = '*')
		@length = len
		@wait_time = wait_time
		@symbol = symbol
	end

	def increment
		print 'Progress: '
		@length.times do |t|
			print @symbol
			sleep @wait_time
			STDOUT.flush
		end
		puts ''
	end
end