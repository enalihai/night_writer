class Writer
  attr_reader :dictionary,
              :file_convert,
              :braille_convert

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
    @split = file.split(//)
  end

  # def remove_unwanted_characters(file)
  #   #method built to remove anything not from the alphabet or _
  #   file.downcase!
  #   binding.pry
  #   file.each_char {|char| char.delete if char.!include?("abcdefghijklmnopqrstuvwxyz ")
  #
  # end

  def braille_convert(file)
    file_convert(file)
    braille_letters = @split.map {|chars| dictionary[chars.to_s]}
      # braille_letters.transpose
    @convert_line1 = braille_letters.collect {|line1| line1[0]}
    @convert_line2 = braille_letters.collect {|line2| line2[1]}
    @convert_line3 = braille_letters.collect {|line3| line3[2]}
    # @line1 = []
    # @line2 = []
    # @line3 = []
    # @split_chars.each {|line| line}
    # binding.pry
    # @split_chars.each {|line| @line2 << line.shift}
    # @split_chars.each {|line| @line3 << line.shift}
    @lines_array = [@convert_line1, @convert_line2, @convert_line3]
    p @lines_array
    # p @converted_letters
  end

  def write_braille
    #this method will take the first element of each array and put it into line1, then it will remove the first element. then it will repeat until there are no more elements.
  end
end
