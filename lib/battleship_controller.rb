require_relative 'battleship_models'
require 'pry'

puts "Welcome to Battleship!"
puts "Play (small) or (large) game?"
size = gets.chomp

board = Board.new(size)
board.add_ships

puts "Enemy ships are in the water!"
puts "(1) Launch a torpedo"
puts "(2) View your score"
puts "(3) View where your topedos have landed"
puts "(4) clear the board and start over"
puts "(5) Quit"
