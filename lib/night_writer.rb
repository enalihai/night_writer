cli  = File.open(ARGV[0], "r")
message_input = cli.read

cli.close

braille_txt = message_input.reverse

message_output = File.open(ARGV[1], "w")
message_output.write(braille_txt)

message_output.close

char_count = braille_txt.length

puts "Created '#{ARGV[1]}' containing #{char_count} characters"
