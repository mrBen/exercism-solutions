=begin
Write your code for the 'Clock' exercise in this file. Make the tests in
`clock_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/clock` directory.
=end

class Clock
  attr_accessor :hour, :minute
  
  def initialize(hour: 0, minute: 0)
    while minute < 0
      hour -= 1
      minute += 60
    end
    while minute >= 60
      hour += 1
      minute -= 60
    end
    @hour = hour % 24
    @minute = minute
  end

  def +(obj)
    Clock.new(hour: @hour + obj.hour, minute: @minute + obj.minute)
  end

  def -(obj)
    Clock.new(hour: @hour - obj.hour, minute: @minute - obj.minute)
  end

  def ==(obj)
    @hour == obj.hour && @minute == obj.minute
  end

  def to_s
    @hour.to_s.rjust(2, "0") + ":" + @minute.to_s.rjust(2, "0")
  end
end