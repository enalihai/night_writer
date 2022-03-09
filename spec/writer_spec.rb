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

    it 'can map a file' do
      file = "acebd"
      @split = file.split(//)

      expect(@split).to eq(["a", "c", "e", "b", "d"])
    end

    # it 'can give the braille components of letters' do
    #
    #
    #   expect(braille_letters).to eq([["0.", "..", ".."], ["00", "..", ".."], ["0.", ".0", ".."], ["0.", "0.", ".."], ["00", ".0", ".."]])
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
  end
end
