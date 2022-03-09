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

    it 'has a library of braille and english' do

      expect(@reader.dictionary["a"]).to eq(["0.", "..", ".."])
      expect(@reader.dictionary[" "]).to eq(["..", "..", ".."])
    end

    it 'can convert braille to english' do
      # binding.pry
      expect(@reader.braille_converter(@stub)).to eq("acebd")
    end

    it 'can check for nil' do

      expect(@reader.dictionary['-']).to eq(nil)
    end

    it 'can remove nil' do
      mock_file = ["0", nil, ".", nil, "0"]
      @compac_file = mock_file.compact

      expect(@compac_file).to eq(["0", ".", "0"])
    end

    it 'can read the elements of the braille_array' do
      @mbraille_array = ["0", ".", "0", ".", "0", "0", ".", ".", "0", ".", ".", ".", ".", ".", ".", ".", ".", "."] #abcc
      expect(@mbraille_array.length/6).to eq(3)
    end
  end
end
