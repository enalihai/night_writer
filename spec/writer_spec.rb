require './spec/spec_helper.rb'
require './lib/writer.rb'
require 'pry'

RSpec.describe Writer do
  before :each do
    @writer = Writer.new
  end
  describe '#writer' do
    it 'exists' do
      expect(@writer).to be_a(Writer)
    end

    it 'has a library of braille and english' do
      # binding.pry
      expect(@writer.dictionary["a"]).to eq(["0", ".", ".", ".", ".", "."])
      expect(@writer.dictionary[" "]).to eq([".", ".", ".", ".", ".", "."])
    end
  end
end
