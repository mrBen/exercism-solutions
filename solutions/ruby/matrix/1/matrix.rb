=begin
Write your code for the 'Matrix' exercise in this file. Make the tests in
`matrix_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/matrix` directory.
=end
class Matrix
  def initialize(matrix)
    @content = []
    matrix.split("\n").each do |row|
      @content << row.split().map { |x| x.to_i }
    end
  end

  def row(n)
    @content[n-1]
  end

  def column(n)
    column = []
    @content.each do |row|
      column << row[n-1]
    end
    column
  end
end