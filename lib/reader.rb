require_relative "tools.rb"
require 'pry'

class Reader < Tools
  def initialize
    @dictionary = {
    "a" => ["0.", "..", ".."],
    "b" => ["0.", "0.", ".."],
    "c" => ["00", "..", ".."],
    "d" => ["00", ".0", ".."],
    "e" => ["0.", ".0", ".."],
    "f" => ["00", "0.", ".."],
    "g" => ["00", "00", ".."],
    "h" => ["0.", "00", ".."],
    "i" => [".0", "0.", ".."],
    "j" => [".0", "00", ".."],
    "k" => ["0.", "..", "0."],
    "l" => ["0.", "0.", "0."],
    "m" => ["00", "..", "0."],
    "n" => ["00", ".0", "0."],
    "o" => ["0.", ".0", "0."],
    "p" => ["00", "0.", "0."],
    "q" => ["00", "00", "0."],
    "r" => ["0.", "00", "0."],
    "s" => [".0", "0.", "0."],
    "t" => [".0", "00", "0."],
    "u" => ["0.", "..", "00"],
    "v" => ["0.", "0.", "00"],
    "w" => [".0", "00", ".0"],
    "x" => ["00", "..", "00"],
    "y" => ["00", ".0", "00"],
    "z" => ["0.", ".0", "00"],
    " " => ["..", "..", ".."]
      }
  end

  def braille_converter(file)
    @compress = file.split(/\n/)
    # @file_to_array = @compress.map{|char| char if char != "\n"}
    @braille_array = @compress.map{|char|char.scan(/.{1,2}/)}
    @braille_array = @braille_array.reject{|array| array.empty?}
    @braille_letters_array = @braille_array.transpose
    @dictionary1 = @dictionary.invert
    @braille_letters_array.map{|letter| @dictionary1[letter]}.join

    # @total_chars = @braille_array.length / 6
# binding.pry
#     ["acebd"]
  end
end
