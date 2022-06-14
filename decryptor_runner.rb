require './lib/translator'

@translator = Translator.new(ARGV[0], ARGV[1], ARGV[2], ARGV[4], true) 
puts @translator.welcome
@translator.translate
@translator.write
