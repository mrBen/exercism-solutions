=begin
Write your code for the 'Simple Cipher' exercise in this file. Make the tests in
`simple_cipher_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/simple-cipher` directory.
=end

class Cipher
  attr_accessor :key
  
  def initialize(key = "thisisaverywellmadecipherkey")
    if key.length == 0 || key.chars.any? { |x| x < 'a' || x > 'z' }
      raise ArgumentError.new
    end
    @key = key
  end

  def encode(plaintext)
    ciphertext = ""
    plaintext.chars.each_with_index do |char,index|
      cipherchar = (char.ord + @key[index].ord - 'a'.ord).chr
      if cipherchar > 'z'
        cipherchar = (cipherchar.ord - 26).chr
      end
      ciphertext += cipherchar
    end
    return ciphertext
  end

  def decode(ciphertext)
    plaintext = ""
    ciphertext.chars.each_with_index do |char,index|
      plainchar = (char.ord - @key[index].ord + 'a'.ord).chr
      if plainchar < 'a'
        plainchar = (plainchar.ord + 26).chr
      end
      plaintext += plainchar
    end
    return plaintext
  end
end