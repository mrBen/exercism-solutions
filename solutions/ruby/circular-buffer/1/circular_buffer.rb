=begin
Write your code for the 'Circular Buffer' exercise in this file. Make the tests in
`circular_buffer_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/circular-buffer` directory.
=end
class CircularBuffer
  class BufferEmptyException < StandardError
  end
  class BufferFullException < StandardError
    end
  
  def initialize(size)
    @size = size
    @buffer = Array.new(@size)
    @iwrite = 0
    @iread = 0
  end

  def read
    raise BufferEmptyException.new unless @iread != @iwrite

    val = @buffer[@iread % @size]
    @buffer[@iread % @size] = nil
    @iread += 1
    
    return val
  end

  def write(content)
    raise BufferFullException.new unless @buffer[@iwrite % @size].nil?
    
    @buffer[@iwrite % @size] = content
    @iwrite += 1
  end

  def write!(content)
    if !@buffer[@iwrite % @size].nil?
      @iread += 1
    end
    
    @buffer[@iwrite % @size] = content
    @iwrite += 1
  end

  def clear
    until @iread == @iwrite
      read()
    end
  end
end