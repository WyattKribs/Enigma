require './lib/encryptor'
require 'date'
class Translator

  attr_reader :input, :output
  def initialize(argument1, argument2)
    @input = argument1
    @output = argument2
    @encryptor = Encryptor.new((Time.new).strftime("%d%m%y").to_i)
  end


  def welcome
    # require 'pry' ; binding.pry
    "Created #{@output} containing #{count} characters"
  end

  def read_input
    File.read(@input).chomp
  end

  def count
    read_input.length
  end

  def translate
    @encryptor.make_keys
    @encryptor.make_offsets
    @encryptor.shift_value
    final_shift = @encryptor.shift(read_input).join
    final_shift
  end

  def read_output
    File.read(@output)
  end

  def write
    File.write(@output, translate)
  end





end
