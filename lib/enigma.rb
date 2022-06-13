require './lib/reader_writer'

class Enigma
  include FileReaderAndWriter
  attr_reader :input_file_name, :output_file_name

  def initialize(input_file_name, output_file_name)
    @input_file_name = input_file_name
    @output_file_name = output_file_name
  end

  def start
    text = read_file(@input_file_name)
    create_output_file(@output_file_name, text)
    confirmation_message(@output_file_name)
  end


  def confirmation_message(output_file_name)
    bob = read_file(output_file_name).chomp.length
    p "Created #{output_file_name} containing #{bob} characters."
  end
end
