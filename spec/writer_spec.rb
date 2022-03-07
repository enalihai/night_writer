require './spec/spec_helper.rb'
require './lib/writer.rb'
require 'pry'

RSpec.describe Writer do
  before :each do
    @writer = Writer.new
    @stub = File.read('mock_message.txt').delete("\n")
  end

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
  end
end
