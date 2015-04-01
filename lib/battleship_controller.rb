require_relative 'battleship_models'
require 'pry'

puts "Welcome to Battleship!"
puts "Play (small) or (large) game?"
size = gets.chomp

puts "Please enter (1) or (2) players"

board = Board.new(size)
board.add_ships(size)

puts "Enemy ships are in the water!"
puts "(1) Launch a torpedo"
puts "(2) View your score"
puts "(3) View where your topedos have landed"
puts "(4) clear the board and start over"
puts "(5) Quit"
user_option = gets.chomp.to_i

  case user_option

  when 1
    ship1_hits = []
    ship2_hits = []

    puts "Select position (row A-J and a column 1-10) to aim your torpedo at:"
    loop do
    torp_position = gets.chomp.to_s
    binding.pry
      if board.ship1.include?(torp_position) == true || board.ship2.include?(torp_position) == true
        puts "launching torpedo!!!! ~~~~~------====>"
        puts "HIT!!!"
        puts "**explosion***"
        ship1_hits << torp_position
        if @ship1 == ship1_hits
          puts "YOU SANK A BATTLESHIP!!!!"
          puts "TEXT ART EXPLOSION"
        end
        break
      elsif board.board.include?(torp_position)
        puts "launching torpedo!!!! ~~~~~------====>"
        puts "miss :("
        break
      else
        puts "Please enter a combination of A-J and 1-10:"
      end
    end



  when 2
    puts "Enter player1 or player2 to view their score"
    player = gets.chomp
    puts Turns.find_by(name: "player1")

  when 3
    puts "Enter player1 or player2 to view their torpedos"



  when 4
    puts "Are you sure you want to clear the board and start over? (yes) or (no)"
    input = gets.chomp
      if input == "yes"

      elsif input == "no"

      else
        puts "Please type yes or no"
      end


  when 5
    puts "Until we meet again!"
    exit

  end
