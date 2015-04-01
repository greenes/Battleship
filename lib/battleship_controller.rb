require_relative 'battleship_models'
require 'pry'


puts " _______  _______  _______  _______  ___      _______  _______  __   __  ___   _______"
puts "|  _    ||   _   ||       ||       ||   |    |       ||       ||  | |  ||   | |       |"
puts "| |_|   ||  |_|  ||_     _||_     _||   |    |    ___||  _____||  |_|  ||   | |    _  |"
puts "|       ||       |  |   |    |   |  |   |    |   |___ | |_____ |       ||   | |   |_| |"
puts "|  _   | |       |  |   |    |   |  |   |___ |    ___||_____  ||       ||   | |    ___|"
puts "| |_|   ||   _   |  |   |    |   |  |       ||   |___  _____| ||   _   ||   | |   | "
puts "|_______||__| |__|  |___|    |___|  |_______||_______||_______||__| |__||___| |___|"


puts "(resume) game or (new) game?"
res_or_new = gets.chomp
    if res_or_new == "new"
      Player1.delete_all
      Player2.delete_all

      puts "Please enter (1) or (2) players"
      players = gets.chomp

      board = Board.new
      board.add_ships
      board.print_board

      @turnhistory = []
      @hitcounter = []
      @ship1_hits = []
      @ship2_hits = []
      @ship3_hits = []
      @ship4_hits = []

      @turnhistory2 = []
      @hitcounter2 = []
      @ship1_hits2 = []
      @ship2_hits2 = []
      @ship3_hits2 = []
      @ship4_hits2 = []

    elsif res_or_new =="resume"

      @turnhistory = []
      @hitcounter = []
      @ship1_hits = []
      @ship2_hits = []
      @ship3_hits = []
      @ship4_hits = []

    end


loop do
puts "<< ~~~Enemy ships are in the water!~~~ >>"
puts "(1) Launch a torpedo"
puts "(2) View your score"
puts "(3) View where your topedos have landed"
puts "(4) Quit"
user_option = gets.chomp.to_i

  case user_option


# Asks the user to enter a positions and returns a hit or a miss
  when 1
    if @turnhistory.count == 5
      puts "<< You have no torpedos left. GAME OVER! >>"
      exit
    end

    puts "<< Select position (row A-J and a column 1-10) to aim your torpedo at: >>"
        @torp_position = gets.chomp.to_s

#checks to see if the position was already played
        if @turnhistory.include?(@torp_position)
          puts "<< You have already sent a torpedo there >>"

#if not, goes ahead and checks to see if it is a hit
        elsif
            if board.ship1.include?(@torp_position) == true
              puts "<<launching torpedo ~~~~~~-----====>>>"
              puts "<<HIT!>>"
              @ship1_hits << @torp_position
            elsif board.ship2.include?(@torp_position) == true
              puts "<<launching torpedo ~~~~~~-----====>>>"
              puts "<<HIT!>>"
              @ship2_hits << @torp_position
            elsif board.ship3.include?(@torp_position) == true
              puts "<<launching torpedo ~~~~~~-----====>>>"
              puts "<<HIT!>>"
              @ship3_hits << @torp_position
            elsif board.ship4.include?(@torp_position)== true
              puts "<<launching torpedo ~~~~~~-----====>>>"
              puts "<<HIT!>>"
              @ship4_hits << @torp_position
            end

              @turnhistory << @torp_position
              @hitcounter << @torp_position

              board.board.map! {|x| x == @torp_position? " X": x}

#adds the turn as a hit to the player1s database
              Player1.create(name: "player1", position: @torp_position, h_or_m: "HIT")

#checks to see if a full ship has been sunk
              if @ship1_hits.count == 5 || @ship2_hits.count == 5 || @ship3_hits.count == 3 || @ship4_hits.count == 2
                  puts "<< YOU SANK A SHIP! >>"


#checks to see if all ships have been sunk
              elsif @turnhistory.count == 15
                  puts "<< YOU SANK ALL ENEMY BATTLESHIPS! CONGRATULATIONS! >>"

              end

#checks to see make sure the position is within the board and returns a miss
            elsif board.board.include?(@torp_position) == true
              puts "<< launching torpedo ~~~~~------====>>>"
              puts "<< miss >>"
              Player1.create(name: "player1", position: @torp_position, h_or_m: "miss")
              @turnhistory << @torp_position
              board.board.map! {|x| x == @torp_position? " O ": x}

            else
              puts "<< Please enter a combination of A-J and 1-10: >>"
            end

# Let player view a list of the positions they have slected and if it was a hit or a miss
  when 2
    puts "<< Enter player1 or player2 to view their score >>"
    player = gets.chomp
    if player == "player1"
    Player1.all.each {|turn| puts "#{Player1.position} : #{Player1.h_or_m}"}
    elsif player == "player2"
    Player2.all.each {|turn| puts "#{Player2.position} : #{Player2.h_or_m}"}
    end

# View the board with hits and misses on it

  when 3
    puts board.board[0..19].join("  ")
    puts board.board[20..39].join("  ")
    puts board.board[40..59].join("  ")
    puts board.board[60..79].join("  ")
    puts board.board[80..99].join("  ")
    puts board.board[100..119].join("  ")
    puts board.board[120..139].join("  ")
    puts board.board[140..159].join("  ")
    puts board.board[160..179].join("  ")
    puts board.board[180..199].join("  ")
    puts board.board[200..219].join("  ")
    puts board.board[220..239].join("  ")
    puts board.board[240..259].join("  ")
    puts board.board[260..279].join("  ")
    puts board.board[280..299].join("  ")
    puts board.board[300..319].join("  ")
    puts board.board[320..339].join("  ")
    puts board.board[340..359].join("  ")
    puts board.board[360..379].join("  ")
    puts board.board[380..399].join("  ")


  when 4
    puts "<< Until we meet again! >>"
    exit

  else
end
end
