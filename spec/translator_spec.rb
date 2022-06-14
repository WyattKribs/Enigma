# require 'rspec'
require './lib/translator'


describe Translator do
  before(:each) do
    @translator = Translator.new("message.txt", "encryption.txt")

  end

  it "is an instance of Translator" do
    expect(@translator).to be_a(Translator)
  end

  it "has a working welcome message" do
    expect(@translator.welcome).to eq('Created encryption.txt containing 11 characters')
  end

  it "can read input" do
    expect(@translator.read_input).to eq("hello world")
  end

  it "can count" do
    expect(@translator.count).to eq(11)
  end

  it "can translate" do
    expect(@translator.translate) != ("hello world")
  end

  it "can write onto a file" do
    @translator.write
    expect(@translator.read_output)
  end

end
