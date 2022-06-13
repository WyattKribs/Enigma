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

end
