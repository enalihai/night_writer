require './lib/reader'
require 'pry'

@reader = Reader.new

cli = File.open(ARGV[0], "r")
message_input = cli.read

cli.close

english_txt = @reader.braille_converter(message_input)

message_output = File.open(ARGV[1], "w")
message_output.write(english_txt)

message_output.close

char_count = english_txt.length

puts "Created '#{ARGV[1]}' containing #{char_count} characters"
