require './lib/enigma'
require 'date'
class Translator

  attr_reader :input, :output, :decrypt, :key, :date
  def initialize(argument1, argument2, key = nil, date = nil, decrypt = false)
    @input = argument1
    @output = argument2
    @key = key
    @date = date
    @decrypt = decrypt
    @encryptor = Enigma.new((Time.new).strftime("%d%m%y").to_i)
  end

  def decryption
    if !@decrypt
      @encryptor.date = @date
    end
  end


  def welcome
    if !@decrypt
      "Created #{@output} containing #{count} characters, key is
       #{@encryptor.rand_number.join} date is #{@encryptor.offset}"
    else
      "Created #{@output} tralnslated by #{@key} and #{@encryptor.date} with #{count} characters"
    end
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
    if @decrypt == false
      final_shift = @encryptor.shift(read_input).join
    else
      final_shift = @encryptor.decryption(read_input, @key, @date).join
    end
    final_shift
  end

  def read_output
    File.read(@output)
  end

  def write
    File.write(@output, translate)
  end


end
