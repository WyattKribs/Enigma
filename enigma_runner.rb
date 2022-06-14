require './lib/translator'

@translator = Translator.new(ARGV[0], ARGV[1])

@translator.translate
@translator.write
puts @translator.welcome
