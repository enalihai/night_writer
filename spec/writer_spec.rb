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
      expect(@writer.dictionary).to eq("a" => ["", "", "", "", "", ""])
    end
  end
end
