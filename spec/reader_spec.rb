require './spec/spec_helper.rb'
require './lib/reader.rb'
require 'pry'

RSpec.describe Reader do
  before :each do
    @reader = Reader.new
    @stub = File.read('mock_stub_braille.txt')
  end
  describe '#reader' do
    it 'exists' do

      expect(@reader).to be_a(Reader)
    end

    it 'can convert braille to english' do
      # binding.pry
      expect(@reader.braille_converter(@stub)).to eq([["0", ".", "0"], ["0", "0", "."], ["0", ".", "0"], ["0", ".", "."], [".", ".", "."], ["0", "0", "."], [".", "0", "."], [".", ".", "."], [".", ".", "."], [".", ".", "."]])
    end
  end
end
