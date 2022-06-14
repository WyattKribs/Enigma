require 'pry'
class Enigma
  attr_reader :letters, :keys, :offsets, :shifts, :date
  def initialize(date)
    @letters = ("a".."z").to_a << " "
    @keys = {:a => [], :b => [], :c => [], :d => []}
    @offsets = {:a => [], :b => [], :c => [], :d => []}
    @shifts = {:a => [], :b => [], :c => [], :d => []}
    @date = date
  end

  def rand_number
    num = (0..4).map do
      rand(0...9)
    end
  end

  def offset
  values = ((@date.to_i) ** 2).to_s[-4..-1].to_i
  end

  def make_keys(values = rand_number)
    @keys[:a] = (values[0].to_s+values[1].to_s).to_i
    @keys[:b] = (values[1].to_s+values[2].to_s).to_i
    @keys[:c] = (values[2].to_s+values[3].to_s).to_i
    @keys[:d] = (values[3].to_s+values[4].to_s).to_i
  end

  def make_offsets
    values = offset
    @offsets[:a] = values.to_s[0].to_i
    @offsets[:b] = values.to_s[1].to_i
    @offsets[:c] = values.to_s[2].to_i
    @offsets[:d] = values.to_s[3].to_i
  end

  def shift_value
    @shifts[:a] = @keys[:a] + @offsets[:a]
    @shifts[:b] = @keys[:b] + @offsets[:b]
    @shifts[:c] = @keys[:c] + @offsets[:c]
    @shifts[:d] = @keys[:d] + @offsets[:d]
  end

  def shift(text, test_key = rand_number)
    make_keys(test_key)
    make_offsets
    shift_value
    text.downcase.chars.each_with_index.map do |char, i|
      if i % 4 == 0
        # binding.pry
        index = @letters.find_index(char)
        char = @letters.rotate(@shifts[:a]+index)[0]
      elsif i % 4 == 1
        # binding.pry
        index = @letters.find_index(char)
        char = @letters.rotate(@shifts[:b]+index)[0]
      elsif i % 4 == 2
        index = @letters.find_index(char)
        char = @letters.rotate(@shifts[:c]+index)[0]
      elsif i % 4 == 3
        index = @letters.find_index(char)
        char = @letters.rotate(@shifts[:d]+index)[0]
      end
    end
  end

  def decryption(text, key, date)
    make_keys(key)
    make_offsets
    shift_value
    text.chars.each_with_index.map do |char, i|
      if i % 4 == 0
        index = @letters.find_index(char)
        negative = @letters.rotate(index)
        char = negative.rotate(-(@shifts[:a]))[0]
      elsif i % 4 == 1
        # binding.pry
        index = @letters.find_index(char)
        negative = @letters.rotate(index)
        char = negative.rotate(-(@shifts[:b]))[0]
      elsif i % 4 == 2
        index = @letters.find_index(char)
        negative = @letters.rotate(index)
        char = negative.rotate(-(@shifts[:c]))[0]
      elsif i % 4 == 3
        index = @letters.find_index(char)
        negative = @letters.rotate(index)
        char = negative.rotate(-(@shifts[:d]))[0]
      end
    end
  end
end
