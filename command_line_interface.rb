def welcome
  puts "Hello"
end

def get_character_from_user
  puts "Please enter a character name"
  character_name = gets.chomp.downcase
  p character_name
end
