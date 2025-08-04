class SimpleCalculator
  ALLOWED_OPERATIONS = ['+', '/', '*'].freeze

  class UnsupportedOperation < StandardError
  end

  def self.calculate(first_operand, second_operand, operation)
    if !ALLOWED_OPERATIONS.include?(operation)
      raise UnsupportedOperation.new
    end

    if !first_operand.is_a?(Integer) || !second_operand.is_a?(Integer)
      raise ArgumentError.new
    end
  
    if operation == '+'
      return "%d + %d = %d" % [first_operand, second_operand, first_operand + second_operand]
    elsif operation == '/'
      if second_operand == 0
        return "Division by zero is not allowed."
      end
      return "%d / %d = %d" % [first_operand, second_operand, first_operand / second_operand]
    elsif operation == '*'
      return "%d * %d = %d" % [first_operand, second_operand, first_operand * second_operand]
    end
  end
end