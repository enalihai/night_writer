require './spec/spec_helper.rb'
require './lib/writer.rb'
require 'pry'

RSpec.describe Writer do
  before :each do
    @writer = Writer.new
    @stub = File.read('mock_message.txt').delete("\n")
    @full_file = File.read('message.txt')
    @long_file = File.read('long_file.txt')
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

    it 'can check' do

      expect(@writer.dictionary['=']).to eq(nil)
    end
    # it 'can convert a file to its characters' do
    #
    #   expect(@writer.file_convert(@stub)).to eq(["a", "c", "e", "b", "d"])
    # end
    #
    # it 'can convert the new file to braille elements' do
    #
    #   expect(@writer.braille_convert(@stub)).to eq([["0.", "00", "0.", "0.", "00"], ["..", "..", ".0", "0.", ".0"], ["..", "..", "..", "..", ".."]])
    # end
    #
    # it 'can write the change the braille to write it' do
    #   # binding.pry
    #   expect(@writer.write_braille(@stub)).to eq(["0.000.0.00", ".....00..0", ".........."])
    # end

    it 'can read and translate english to braille' do

      expect(@writer.file_converter(@stub)).to eq("0.000.0.00\n.....00..0\n..........\n\n")
    end

    it 'can print the rest of the braille' do

      expect(@writer.file_converter(@full_file)).to eq("0...0.00000.00000..0.00...000.0.0..0...00..00000.0..0.00..0.0.0.000..00000...00.\n.0.........0..0.0.0.0.00..0000.0..00..00000..0000...0..0..00.0....000..000..00.0\n..........0.0.0.0...0.......0.....0...0.....0...0.....00..0...........0.....0.0.\n\n.00.0.00...00.0....00...000.0.0.00..0.0.000.000.\n00..00.0..0000.0..00.0.....0..0..0..0..0...0...0\n.0..0......0..0....0......0.000...........0.0...")
    end
  end
end
