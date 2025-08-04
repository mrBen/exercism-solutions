=begin
Write your code for the 'Two Bucket' exercise in this file. Make the tests in
`two_bucket_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/two-bucket` directory.
=end
require "ostruct"
require "set"

class TwoBucket
  def initialize(bucket1_size, bucket2_size, target, first)
    @bucket1_size = bucket1_size
    @bucket2_size = bucket2_size
    @target = target
    @first = first

    starting = OpenStruct.new
    starting.nb_moves = 1
    if first == "one"
      starting.bucket1 = @bucket1_size
      starting.bucket2 = 0
    else
      starting.bucket1 = 0
      starting.bucket2 = @bucket2_size
    end

    @bucket1 = starting.bucket1
    @bucket2 = starting.bucket2
    @moves = starting.nb_moves

    steps = Array.new
    @visited = Set.new
    steps << starting
    @visited << [starting.bucket1, starting.bucket2]

    while @bucket1 != @target && @bucket2 != @target
      step = steps.shift
      next_steps(step).each do |x|
        steps << x
      end
    end
  end

  def moves
    @moves
  end

  def goal_bucket
    if @bucket1 == @target
      "one"
    else
      "two"
    end
  end

  def other_bucket
    if @bucket1 == @target
      @bucket2
    else
      @bucket1
    end
  end

  def next_steps(step)
    nexts = Array.new

    # pouring one bucket into the other
    flow = [step.bucket1, @bucket2_size - step.bucket2].min
    n = OpenStruct.new
    n.bucket1 = step.bucket1 - flow
    n.bucket2 = step.bucket2 + flow
    n.nb_moves = step.nb_moves + 1
    if is_valid(n, step)
      nexts << n
    end
    flow = [step.bucket2, @bucket1_size - step.bucket1].min
    n = OpenStruct.new
    n.bucket1 = step.bucket1 + flow
    n.bucket2 = step.bucket2 - flow
    n.nb_moves = step.nb_moves + 1
    if is_valid(n, step)
      nexts << n
    end

    # emptying buckets
    if step.bucket1 > 0
      n = OpenStruct.new
      n.bucket1 = 0
      n.bucket2 = step.bucket2
      n.nb_moves = step.nb_moves + 1
      if is_valid(n, step)
        nexts << n
      end
    end
    if step.bucket2 > 0
      n = OpenStruct.new
      n.bucket1 = step.bucket1
      n.bucket2 = 0
      n.nb_moves = step.nb_moves + 1
      if is_valid(n, step)
        nexts << n
      end
    end

    # filling buckets
    n = OpenStruct.new
    n.bucket1 = @bucket1_size
    n.bucket2 = step.bucket2
    n.nb_moves = step.nb_moves + 1
    if is_valid(n, step)
      nexts << n
    end
    n = OpenStruct.new
    n.bucket1 = step.bucket1
    n.bucket2 = @bucket2_size
    n.nb_moves = step.nb_moves + 1
    if is_valid(n, step)
      nexts << n
    end

    return nexts
  end

  def is_valid(step, previous)
    if step.bucket1 == previous.bucket1 && step.bucket2 == previous.bucket2
      return false
    end

    if step.bucket1 < 0 || step.bucket1 > @bucket1_size
      return false
    end

    if step.bucket2 < 0 || step.bucket2 > @bucket2_size
      return false
    end

    if @first == "one"
      if step.bucket1 == 0 && step.bucket2 == @bucket2_size
        return false
      end
    else
      if step.bucket2 == 0 && step.bucket1 == @bucket1_size
        return false
      end
    end

    if step.bucket1 == @target || step.bucket2 == @target
      @bucket1 = step.bucket1
      @bucket2 = step.bucket2
      @moves = step.nb_moves
    end

    if !@visited.include?([step.bucket1, step.bucket2])
      @visited << [step.bucket1, step.bucket2]
    end

    # puts "%d: %d %d -> %d %d" % [previous.nb_moves, previous.bucket1, previous.bucket2, step.bucket1, step.bucket2]
    return true
  end
end
