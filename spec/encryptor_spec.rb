require './lib/enigma'
require 'pry'

describe Enigma do
  before(:each) do
    @bob = Enigma.new(061322)
  end

  it "has an array of characters" do
    expect(@bob.letters.length).to eq(27)
  end

  it "makes empty keys by default" do
    expect(@bob.keys[:a]).to eq([])
    expect(@bob.keys[:b]).to eq([])
    expect(@bob.keys[:c]).to eq([])
    expect(@bob.keys[:d]).to eq([])
  end

  it "can generate a random 5 digit number" do
    expect(@bob.rand_number.length).to eq(5)
  end

  it "can make a random five digit number" do
    expect(@bob.rand_number.length).to eq(5)
  end

  it "can create keys" do
    @bob.make_keys("12345")
    # binding.pry
    expect(@bob.keys[:a]).to eq(12)
    expect(@bob.keys[:b]).to eq(23)
    expect(@bob.keys[:c]).to eq(34)
    expect(@bob.keys[:d]).to eq(45)
  end

  it "can make offset values" do
    expect(@bob.offset).to eq(8804)
  end

  it "can creat offsets" do
    @bob.make_offsets
    expect(@bob.offsets[:a]).to eq(8)
    expect(@bob.offsets[:b]).to eq(8)
    expect(@bob.offsets[:c]).to eq(0)
    expect(@bob.offsets[:d]).to eq(4)
  end

  it "makes a full shift" do
    @bob.shift_value
    expect(@bob.shifts[:a]).to eq(@bob.keys[:a] + @bob.offsets[:a])
  end

  it "can encrypt text" do
    # binding.pry
    expect(@bob.shift("Hello World", "12345")).to eq(
      ["a", "i", "s", "g", "h", "d", "c", "j", "k", "p", "k"])
  end

  it "can decrypt text" do
    expect(@bob.decryption("aisghdcjkpk", "12345", "061322").join).to eq("hello world")
  end
end
