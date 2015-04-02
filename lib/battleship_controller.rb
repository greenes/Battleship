require_relative 'battleship_models'
require 'pry'

loop do
puts " _______  _______  _______  _______  ___      _______  _______  __   __  ___   _______"
puts "|  _    ||   _   ||       ||       ||   |    |       ||       ||  | |  ||   | |       |"
puts "| |_|   ||  |_|  ||_     _||_     _||   |    |    ___||  _____||  |_|  ||   | |    _  |"
puts "|       ||       |  |   |    |   |  |   |    |   |___ | |_____ |       ||   | |   |_| |"
puts "|  _   | |       |  |   |    |   |  |   |___ |    ___||_____  ||       ||   | |    ___|"
puts "| |_|   ||   _   |  |   |    |   |  |       ||   |___  _____| ||   _   ||   | |   | "
puts "|_______||__| |__|  |___|    |___|  |_______||_______||_______||__| |__||___| |___|"


puts "(new) game or (load) game?"
res_or_new = gets.chomp
    if res_or_new == "new"
      Turn.delete_all

      puts "Please enter (1) or (2) players"
      players = gets.chomp
        if players == "1"
          board1 = Board.new
          board1.add_ships
          board1.print_board
        elsif players == "2"
          board1 = Board.new
          board1.add_ships
          board2 = Board.new
          board2.add_ships
        end
      system "clear"

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
      puts "(2) View scores"
      puts "(3) View where topedos have landed"
      puts "(4) Quit"
      user_option = gets.chomp.to_i

  case user_option


# Asks the user to enter a positions and returns a hit or a miss
  when 1
    # if Turn.last(:name) == "player1"
    #
    #   system "clear"
    #   puts "Player1 turn"

    if @turnhistory.count == 5
      system "clear"
      puts "<< You have no torpedos left. GAME OVER! >>"
    end

    puts "<< Select position (row A-J and a column 1-10) to aim your torpedo at: >>"
        @torp_position = gets.chomp.to_s

#checks to see if the position was already played
        if @turnhistory.include?(@torp_position)
          puts "<< You have already sent a torpedo there >>"

#if not, goes ahead and checks to see if it is a hit
        elsif
            if board1.ship1.include?(@torp_position) == true
              puts "<<launching torpedo ~~~~~~-----====>>>"
              sleep 0.5
              system "clear"
              puts "<<HIT!>>"
              @ship1_hits << @torp_position
            elsif board1.ship2.include?(@torp_position) == true
              puts "<<launching torpedo ~~~~~~-----====>>>"
              sleep 0.5
              system "clear"
              puts "<<HIT!>>"
              @ship2_hits << @torp_position
            elsif board1.ship3.include?(@torp_position) == true
              puts "<<launching torpedo ~~~~~~-----====>>>"
              sleep 0.5
              system "clear"
              puts "<<HIT!>>"
              @ship3_hits << @torp_position
            elsif board1.ship4.include?(@torp_position)== true
              puts "<<launching torpedo ~~~~~~-----====>>>"
              sleep 0.5
              system "clear"
              puts "<<HIT!>>"
              @ship4_hits << @torp_position
            end

              @turnhistory << @torp_position
              @hitcounter << @torp_position

              board1.board.map! {|x| x == @torp_position? " X": x}

#adds the turn as a hit to the player1s database
              Turn.create(name: "player1", position: @torp_position, h_or_m: "HIT")

#checks to see if a full ship has been sunk
              if @ship1_hits.count == 5 || @ship2_hits.count == 5 || @ship3_hits.count == 3 || @ship4_hits.count == 2
                  puts "<< YOU SANK A SHIP! >>"


#checks to see if all ships have been sunk
              elsif @turnhistory.count == 15
                  puts "<< YOU SANK ALL ENEMY BATTLESHIPS! CONGRATULATIONS! >>"

              end

#checks to see make sure the position is within the board and returns a miss
            elsif board1.board.include?(@torp_position) == true
              puts "<< launching torpedo ~~~~~------====>>>"
              sleep 0.5
              system "clear"
              puts "<< miss >>"
              Turn.create(name: "player1", position: @torp_position, h_or_m: "miss")
              @turnhistory << @torp_position
              board.board.map! {|x| x == @torp_position? " O ": x}

            else
              puts "<< Please enter a combination of A-J and 1-10: >>"
            end



    #   else
    #     system "clear"
    #     puts "Player2 turn"
    #
    # # Asks the user to enter a positions and returns a hit or a miss
    #
    #     if @turnhistory2.count == 5
    #       puts "<< You have no torpedos left. GAME OVER! >>"
    #       exit
    #     end
    #
    #     puts "<< Select position (row A-J and a column 1-10) to aim your torpedo at: >>"
    #         @torp_position = gets.chomp.to_s
    #
    # #checks to see if the position was already played
    #         if @turnhistory2.include?(@torp_position)
    #           puts "<< You have already sent a torpedo there >>"
    #
    # #if not, goes ahead and checks to see if it is a hit
    #         elsif
    #             if board2.ship1_p2.include?(@torp_position) == true
    #               puts "<<launching torpedo ~~~~~~-----====>>>"
    #               sleep 0.5
    #               system "clear"
    #               puts "<<HIT!>>"
    #               @ship1_hits2 << @torp_position
    #             elsif board2.ship2_p2.include?(@torp_position) == true
    #               puts "<<launching torpedo ~~~~~~-----====>>>"
    #               sleep 0.5
    #               system "clear"
    #               puts "<<HIT!>>"
    #               @ship2_hits2 << @torp_position
    #             elsif board2.ship3_p2.include?(@torp_position) == true
    #               puts "<<launching torpedo ~~~~~~-----====>>>"
    #               sleep 0.5
    #               system "clear"
    #               puts "<<HIT!>>"
    #               @ship3_hits2 << @torp_position
    #             elsif board2.ship4_p2.include?(@torp_position)== true
    #               puts "<<launching torpedo ~~~~~~-----====>>>"
    #               sleep 0.5
    #               system "clear"
    #               puts "<<HIT!>>"
    #               @ship4_hits2 << @torp_position
    #             end
    #
    #               @turnhistory2 << @torp_position
    #               @hitcounter2 << @torp_position
    #
    #                 board2.board.map! {|x| x == @torp_position? " X": x}
    #
    # #adds the turn as a hit to the player1s database
    #                 Turn.create(name: "player2", position: @torp_position, h_or_m: "HIT")
    #
    # #checks to see if a full ship has been sunk
    #                 if @ship1_hits2.count == 5 || @ship2_hits2.count == 5 || @ship3_hits2.count == 3 || @ship4_hits2.count == 2
    #                     puts "<< YOU SANK A SHIP! >>"
    #
    # #checks to see if all ships have been sunk
    #                 elsif @turnhistory2.count == 15
    #                     puts "<< YOU SANK ALL ENEMY BATTLESHIPS! CONGRATULATIONS! >>"
    #                 end
    #
    # #checks to see make sure the position is within the board and returns a miss
    #               elsif board2.board.include?(@torp_position) == true
    #               puts "<< launching torpedo ~~~~~------====>>>"
    #               sleep 0.5
    #               system "clear"
    #               puts "<< miss >>"
    #               Turn.create(name: "player2", position: @torp_position, h_or_m: "miss")
    #               @turnhistory2 << @torp_position
    #               board2.board.map! {|x| x == @torp_position? " O ": x}
    #
    #             else
    #               puts "<< Please enter a combination of A-J and 1-10: >>"
    #             end
    #           end
    #


# Let player view a list of the positions they have slected and if it was a hit or a miss
  when 2
    puts "<< Enter player1 or player2 to view their score >>"
    player = gets.chomp
    if player == "player1"
      @player_turns = Turn.where(name: "player1")
      @player_turns.each do |turn|
      puts "#{turn.position} : #{turn.h_or_m}"
    end

    elsif player == "player2"
      @player_turns = Turn.where(name: "player2")
      @player_turns.each do |turn|
      puts "#{turn.position} : #{turn.h_or_m}"
    end
  end

# View the board with hits and misses on it

  when 3
    system "clear"
    puts "Enter player1 or player2 to view their board"
     board_player = gets.chomp
      if board_player == "player1"
        puts board1.board[0..19].join("  ")
        puts board1.board[20..39].join("  ")
        puts board1.board[40..59].join("  ")
        puts board1.board[60..79].join("  ")
        puts board1.board[80..99].join("  ")
        puts board1.board[100..119].join("  ")
        puts board1.board[120..139].join("  ")
        puts board1.board[140..159].join("  ")
        puts board1.board[160..179].join("  ")
        puts board1.board[180..199].join("  ")
        puts board1.board[200..219].join("  ")
        puts board1.board[220..239].join("  ")
        puts board1.board[240..259].join("  ")
        puts board1.board[260..279].join("  ")
        puts board1.board[280..299].join("  ")
        puts board1.board[300..319].join("  ")
        puts board1.board[320..339].join("  ")
        puts board1.board[340..359].join("  ")
        puts board1.board[360..379].join("  ")
        puts board1.board[380..399].join("  ")
      elsif board_player == "player2"
        puts board2.board[0..19].join("  ")
        puts board2.board[20..39].join("  ")
        puts board2.board[40..59].join("  ")
        puts board2.board[60..79].join("  ")
        puts board2.board[80..99].join("  ")
        puts board2.board[100..119].join("  ")
        puts board2.board[120..139].join("  ")
        puts board2.board[140..159].join("  ")
        puts board2.board[160..179].join("  ")
        puts board2.board[180..199].join("  ")
        puts board2.board[200..219].join("  ")
        puts board2.board[220..239].join("  ")
        puts board2.board[240..259].join("  ")
        puts board2.board[260..279].join("  ")
        puts board2.board[280..299].join("  ")
        puts board2.board[300..319].join("  ")
        puts board2.board[320..339].join("  ")
        puts board2.board[340..359].join("  ")
        puts board2.board[360..379].join("  ")
        puts board2.board[380..399].join("  ")
      end



  when 4
    puts "<< Until we meet again! >>"
    exit

  else
end
end
end
