require './lib/translator'

@translator = Translator.new(ARGV[0], ARGV[1], key = nil, date = nil, decrypt = false)

puts @translator.welcome
@translator.translate
@translator.write
