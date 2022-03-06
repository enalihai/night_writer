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
  end
end
