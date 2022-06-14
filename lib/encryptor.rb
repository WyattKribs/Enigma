require 'pry'
class Encryptor
  attr_reader :letters, :keys, :offsets, :shifts
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

  def make_keys
    values = rand_number
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

  def shift(text)
    make_keys
    make_offsets
    shift_value
    text.downcase.chars.each_with_index.map do |char, i|
      if i % 4 == 0
        if @shifts[:a] > 27
          char = @letters.rotate(@shifts[:a] - 27)[i]
        else
          char = @letters.rotate(@shifts[:a])[i]
        end
      elsif i % 4 == 1
        if @shifts[:b] > 27
          char = @letters.rotate(@shifts[:b] - 27)[i]
        else
          char = @letters.rotate(@shifts[:b])[i]
        end
      elsif i % 4 == 2
        if @shifts[:c] > 27
          char = @letters.rotate(@shifts[:c] - 27)[i]
        else
          char = @letters.rotate(@shifts[:c])[i]
        end
      elsif i % 4 == 3
        if @shifts[:d] > 27
          char = @letters.rotate(@shifts[:d] - 27)[0]
        else
          char = @letters.rotate(@shifts[:d])[0]
        end
      end
    end
  end
end
