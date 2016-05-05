# This is a fake progress bar for causing a (somewhat)
# more interesting delay during program execution. there
# are plenty of gems that are real progress bars but using
# them in the demo driver code would have been strange without
# indroducing some background processing ... which i have yet
# to learn in Ruby.
class FakeProgressBar
  def initialize(len, wait_time = 0.1, symbol = '*')
    @length    = len
    @wait_time = wait_time
    @symbol    = symbol
  end

  def reset(len, wait_time = 0.1, symbol = '*')
    @length    = len
    @wait_time = wait_time
    @symbol    = symbol
  end

  def increment
    print 'Progress: '
    @length.times do
      print @symbol
      sleep @wait_time
      STDOUT.flush
    end
    puts ''
  end
end
