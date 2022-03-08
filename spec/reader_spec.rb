require './spec/spec_helper.rb'
require './lib/reader.rb'
require 'pry'

RSpec.describe Reader do
  before :each do
    @reader = Reader.new
  end
  describe '#reader' do
    it 'exists' do

      expect(@reader).to be_a(Reader)
    end
  end
end
