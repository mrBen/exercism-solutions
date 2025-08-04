class AllYourBase {
  static rebase(inputBase, digits, outputBase) {
    if (inputBase < 2) {
      Fiber.abort("input base must be >= 2")
    }
    if (outputBase < 2) {
      Fiber.abort("output base must be >= 2")
    }
    for (digit in digits) {
      if (digit < 0 || digit >= inputBase) {
        Fiber.abort("all digits must satisfy 0 <= d < input base")
      }
    }

    var value = 0
    for (i in 0...digits.count) {
      value = value + (digits[i] * inputBase.pow(digits.count - i - 1))
    }
    
    var output = []
    var i = 0
    while (outputBase.pow(i) <= value) {
      output.insert(0, (value % outputBase.pow(i + 1)) / outputBase.pow(i))
      value = value - (value % outputBase.pow(i + 1))
      i = i + 1
    }
    
    if (output.count == 0) {
      output.add(0)
    }
    return output
  }
}
