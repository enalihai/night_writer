class Writer
  attr_reader :dictionary

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

  def file_convert(file)
    # binding.pry
    # @popped_off = file.split(//).pop
    @split = file.split(//)
    @split
  end

  def braille_convert(file)
    # binding.pry
    file_convert(file)
    braille_letters = @split.map {|char| dictionary[char.to_s]}
    @lines = braille_letters.transpose
  end

  def write_braille(file)
    braille_convert(file)
    @lines.map{|line| line.join("")}
  end


  def file_converter(file)
    @split = file.split(//)
    braille_letters = @split.map{|char| dictionary[char]}
    braille_letters.delete(nil)
    @lines = braille_letters.transpose
    @lines.map{|line| line.join("")}
  end
end
