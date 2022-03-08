require './spec/spec_helper.rb'
require './lib/writer.rb'
require 'pry'

RSpec.describe Writer do
  before :each do
    @writer = Writer.new
    @stub = File.read('mock_message.txt').delete("\n")
    @full_file = File.read('message.txt')
  end
# binding.pry
  describe '#writer' do
    it 'exists' do

      expect(@writer).to be_a(Writer)
    end

    it 'has a library of braille and english' do

      expect(@writer.dictionary["a"]).to eq(["0.", "..", ".."])
      expect(@writer.dictionary[" "]).to eq(["..", "..", ".."])
    end

    it 'can convert a file to its characters' do

      expect(@writer.file_convert(@stub)).to eq(["a", "c", "e", "b", "d"])
    end

    it 'can convert the new file to braille elements' do

      expect(@writer.braille_convert(@stub)).to eq([["0.", "00", "0.", "0.", "00"], ["..", "..", ".0", "0.", ".0"], ["..", "..", "..", "..", ".."]])
    end

    it 'can write the change the braille to write it' do
      # binding.pry
      expect(@writer.write_braille(@stub)).to eq(["0.000.0.00", ".....00..0", ".........."])
    end

    it 'can read and translate english to braille' do

      expect(@writer.file_converter(@stub)).to eq("0.000.0.00\n.....00..0\n..........\n\n")
    end

    xit 'can select different parts of the array' do

      expect(@writer.file_converter(@full_file)).to eq("0.000.0.00\n.....00..0\n..........\n\n")
    end
  end
end
