=begin
Write your code for the 'Binary Search Tree' exercise in this file. Make the tests in
`binary_search_tree_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/binary-search-tree` directory.
=end
class Bst
  attr_accessor :data, :left, :right
  include Enumerable
  
  def initialize(data)
    @data = data
  end

  def insert(data)
    if data <= @data
      if @left.nil?
        @left = Bst.new(data)
      else
        @left.insert(data)
      end
    else
      if @right.nil?
         @right = Bst.new(data)
      else
        @right.insert(data)
      end
    end
  end

  def each(&block)
    if block_given?
      @left.each(&block) if @left
      block.call(@data)
      @right.each(&block) if @right
    else
      to_enum(:each)
    end
  end
end