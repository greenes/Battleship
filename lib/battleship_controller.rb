require_relative 'battleship_models'
require 'pry'

puts "Welcome to Battleship!"

puts "Play (small) or (large) game?"
size = gets.chomp

  loop do
  if size == "small"
    @rows = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J"]
    @columns = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
    break
  elsif size == "large"
    @rows = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T"]
    @columns = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20]
    break
  else
    puts "please enter 'small' or 'large'"
    size = gets.chomp
  end
end

@rows.product(@columns) do |position|
    puts position.join
  end

puts "Enemy ships are in the water!"
