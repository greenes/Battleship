require_relative 'battleship_models'
require 'pry'

        loop do
        system "clear"
        puts "                     _______  _______  _______  _______  ___      _______  _______  __   __  ___   _______"
        puts "                    |  _    ||   _   ||       ||       ||   |    |       ||       ||  | |  ||   | |       |"
        puts "                    | |_|   ||  |_|  ||_     _||_     _||   |    |    ___||  _____||  |_|  ||   | |    _  |"
        puts "                    |       ||       |  |   |    |   |  |   |    |   |___ | |_____ |       ||   | |   |_| |"
        puts "                    |  _   | |       |  |   |    |   |  |   |___ |    ___||_____  ||       ||   | |    ___|"
        puts "                    | |_|   ||   _   |  |   |    |   |  |       ||   |___  _____| ||   _   ||   | |   | "
        puts "                    |_______||__| |__|  |___|    |___|  |_______||_______||_______||__| |__||___| |___|"
        puts " "
        puts "                                              (new) game or (load) game?"

        res_or_new = gets.chomp

#Starts out with empty arrays
#One for each player for counting and keeping track of all turns
#One for for each player for counting the number of "hits"
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
#Creates a new board with random ships for player1 and one for player2
            board1 = Board.new
            board2 = Board.new
            board1.add_ships
            board2.add_ships
            Ship.create(name: "battleship1", array: board1.ship1)
            Ship.create(name: "battleship2", array: board1.ship2)
            Ship.create(name: "destroyer", array: board1.ship3)
            Ship.create(name: "submarine", array: board1.ship4)
            Ship.create(name: "battleship1", array: board2.ship1)
            Ship.create(name: "battleship2", array: board2.ship2)
            Ship.create(name: "destroyer", array: board2.ship3)
            Ship.create(name: "submarine", array: board2.ship4)


            if res_or_new == "new"
#Clears data from the SQL table with all the turns from the previous game
              Turn.delete_all
              Ship.delete_all
              board1.add_ships
              board2.add_ships
#Prints out what the board looks like
                system "clear"
                board1.print_board

#Starts out with empty arrays
#One for each player for counting and keeping track of all turns
#One for for each player for counting the number of "hits"
#One for for each player for counting the hits on each of the ships

            elsif res_or_new =="load"

              @ship1 = Ship.find(1).array

              @ship2 = Ship.find(2).array

              @ship3 = Ship.find(3).array

              @ship4 = Ship.find(4).array

              @ship1_p2 = Ship.find(5).array

              @ship2_p2 = Ship.find(6).array

              @ship3_p2 = Ship.find(7).array

              @ship4_p2 = Ship.find(8).array

#Populates the arrays with data from the last open game

                  Turn.where(name: "player1", h_or_m: "HIT").each do |turn|
                    @turnhistory << turn.position
                    board1.board.map! do |x|
                      if x == turn.position
                         x = "[X]"
                       end
                     end
                   end

                  Turn.where(name: "player2", h_or_m: "HIT").each do |turn|
                    @turnhistory2 << turn.position
                    board2.board.map! do |x|
                      if x == turn.position
                        x = "[X]"
                      end
                    end
                  end

                  Turn.where(name: "player1", h_or_m: "miss").each do |turn|
                    @turnhistory << turn.position
                    board1.board.map! do |x|
                      if x == turn.position
                         x = "[0]"
                       end
                     end
                   end

                  Turn.where(name: "player2", h_or_m: "miss").each do |turn|
                    @turnhistory2 << turn.position
                    board2.board.map! do |x|
                      if x == turn.position
                        x = "[0]"
                      end
                    end
                  end

                  Turn.where(name: "player1", ship: "battleship1").each {|turn| @ship1_hits << turn.position}

                  Turn.where(name: "player1", ship: "battleship2").each {|turn| @ship2_hits << turn.position}

                  Turn.where(name: "player1", ship: "destroyer").each {|turn| @ship3_hits << turn.position}

                  Turn.where(name: "player1", ship: "submarine").each {|turn| @ship4_hits << turn.position}

                  Turn.where(name: "player2", ship: "battleship1").each {|turn| @ship1_hits2 << turn.position}

                  Turn.where(name: "player2", ship: "battleship2").each {|turn| @ship2_hits2 << turn.position}

                  Turn.where(name: "player2", ship: "destroyer").each {|turn| @ship3_hits2 << turn.position}

                  Turn.where(name: "player2", ship: "submarine").each {|turn| @ship4_hits2 << turn.position}

                end

        loop do
              puts "<< ~~~Enemy ships are in the water!~~~ >>"
              puts "(1) Launch a torpedo"
              puts "(2) View scores"
              puts "(3) View your board"
              puts "(4) Quit"
              user_option = gets.chomp.to_i

          case user_option

# Asks the user to enter a positions and returns a hit or a miss
          when 1
#Checks to see who's turn it is based on the last player's turn in the database
            last_turn = Turn.last
            if last_turn == nil || last_turn.name == "player2"

              system "clear"
              puts "Player1 turn"

            if @turnhistory.count == 30
              system "clear"
              board1.battleship
              puts "                   << You have no torpedos left. Player2 WINS! >>"
              sleep 3
              break
            end
#Asks player1 to enter a position
            puts "<< Select position (row A-T and a column 1-20) to aim your torpedo at: >>"
                @torp_position = gets.chomp.to_s

#Checks to see if player1 has alrady played that position
                if @turnhistory.include?(@torp_position)
                  puts "<< You have already sent a torpedo there >>"

#If position was not already played, game goes ahead and checks to see if it is a hit
                elsif
                    if board1.ship1.include?(@torp_position) == true || board1.ship2.include?(@torp_position) == true || board1.ship3.include?(@torp_position) == true || board1.ship4.include?(@torp_position)== true
                      system "clear"
                      puts "launching torpedo..............."
                      puts "        ~~     (\\\\_____________________"
                      puts "     ~~~~     <))_____________#{@torp_position}_______}"
                      puts "       ~~~     (//   "
                      sleep 1
                      system "clear"
                      board1.hit
#Adds the turn as a hit to the player1s database
#Adds the position to player1's turn history, to player1's hit history, and updates player1's board
                       if board1.ship1.include?(@torp_position) == true
                         @ship1_hits << @torp_position
                         Turn.create(name: "player1", position: @torp_position, h_or_m: "HIT", ship: "battleship1")
                       elsif board1.ship2.include?(@torp_position) == true
                         @ship2_hits << @torp_position
                         Turn.create(name: "player1", position: @torp_position, h_or_m: "HIT", ship: "battleship2")
                       elsif board1.ship3.include?(@torp_position) == true
                         @ship3_hits << @torp_position
                         Turn.create(name: "player1", position: @torp_position, h_or_m: "HIT", ship: "destroyer")
                       elsif board1.ship4.include?(@torp_position)== true
                         @ship4_hits << @torp_position
                         Turn.create(name: "player1", position: @torp_position, h_or_m: "HIT", ship: "submarine")
                       end
                     end

                      @turnhistory << @torp_position
                      @hitcounter << @torp_position
                      board1.board.map! {|x| x == @torp_position? "[X]": x}


#Checks to see if a player1 has sunk a full ship of player2's
                      if @ship1_hits.count == 5 || @ship2_hits.count == 5 || @ship3_hits.count == 3 || @ship4_hits.count == 2
                          puts "<< YOU SANK A SHIP! >>"


#Checks to see if player1 has sunk of of player2's ships
                      elsif @hitcounter.count == 15
                          system "clear"
                          board1.battleship
                          puts "                 << YOU SANK ALL ENEMY BATTLESHIPS! Player1 Wins! >>"
                          sleep 3
                          break
                      end

#Checks to see make sure the player1's position is within the board and returns a miss
                  elsif board1.board.include?(@torp_position) == true
                      system "clear"
                      puts "launching torpedo..............."
                      puts "        ~~     (\\\\_____________________"
                      puts "     ~~~~     <))_____________#{@torp_position}_______}"
                      puts "       ~~~     (//   "
                      sleep 1
                      system "clear"
                      puts ")`'-.,_)`'-.,_)`'-.,_)`'-.,_)`'-.,_)`'-.,_)`'-.,_)`'-.,_"
                      puts "                       << miss >>"
                      Turn.create(name: "player1", position: @torp_position, h_or_m: "miss", ship: " ")
#Adds position to player1's turn history
                      @turnhistory << @torp_position
                      board1.board.map! {|x| x == @torp_position? "[0]": x}

                    else
                      puts "<< Please enter a combination of A-T and 1-20: >>"
                    end


              elsif last_turn.name == "player1"
                system "clear"
                puts "Player2 turn"

# Asks player2 to enter a positions and returns a hit or a miss

                if @turnhistory2.count == 30
                  system "clear"
                  board1.battleship
                  puts "                       << You have no torpedos left. Player1 WINS! >>"
                  sleep 3
                  break
                end

                puts "<< Select position (row A-T and a column 1-20) to aim your torpedo at: >>"
                    @torp_position = gets.chomp.to_s

#Checks to see if player2 has already played that position
                    if @turnhistory2.include?(@torp_position)
                      puts "<< You have already sent a torpedo there >>"

#If not, goes ahead and checks to see if player2's position is a hit
                    elsif
                        if board2.ship1_p2.include?(@torp_position) == true || board2.ship2_p2.include?(@torp_position) == true || board2.ship3_p2.include?(@torp_position) == true || board2.ship4_p2.include?(@torp_position)== true
                          system "clear"
                          puts "launching torpedo..............."
                          puts "        ~~     (\\\\_____________________"
                          puts "     ~~~~     <))_____________#{@torp_position}_______}"
                          puts "       ~~~     (//   "
                          sleep 1
                          system "clear"
                          board1.hit
#Adds the turn as a hit to the Turn database
#Adds the position to player2's turn history, to player2's hit history, and updates player2's board
                           if board2.ship1_p2.include?(@torp_position) == true
                             @ship1_hits2 << @torp_position
                             Turn.create(name: "player2", position: @torp_position, h_or_m: "HIT", ship: "battleship1")
                           elsif board2.ship2_p2.include?(@torp_position) == true
                             @ship2_hits2 << @torp_position
                             Turn.create(name: "player2", position: @torp_position, h_or_m: "HIT", ship: "battleship2")
                           elsif board2.ship3_p2.include?(@torp_position) == true
                             @ship3_hits2 << @torp_position
                             Turn.create(name: "player2", position: @torp_position, h_or_m: "HIT", ship: "destroyer")
                           elsif board2.ship4_p2.include?(@torp_position)== true
                             @ship4_hits2 << @torp_position
                             Turn.create(name: "player2", position: @torp_position, h_or_m: "HIT", ship: "submarine")
                           end
                         end

                          @turnhistory2 << @torp_position
                          @hitcounter2 << @torp_position
                          board2.board.map! {|x| x == @torp_position? "[X]": x}

#Checks to see if player 2 has sunk a full ship
                          if @ship1_hits2.count == 5 || @ship2_hits2.count == 5 || @ship3_hits2.count == 3 || @ship4_hits2.count == 2
                            puts "<< YOU SANK A SHIP! >>"

#Checks to see if player2 has sunk all of player1's ships
                          elsif @hitcounter2.count == 15
                            system "clear"
                            board1.battleship
                            puts "                    << YOU SANK ALL ENEMY BATTLESHIPS! Player2 Wins! >>"
                            sleep 3
                            break
                          end

#Checks to see make sure player2's position choice is within the board and returns a miss
                          elsif board2.board.include?(@torp_position) == true
                            system "clear"
                            puts "launching torpedo..............."
                            puts "        ~~     (\\\\_____________________"
                            puts "     ~~~~     <))_____________#{@torp_position}_______}"
                            puts "       ~~~     (//   "
                            sleep 1
                            system "clear"
                            puts ")`'-.,_)`'-.,_)`'-.,_)`'-.,_)`'-.,_)`'-.,_)`'-.,_)`'-.,_"
                            puts "                    << miss >>"
                            Turn.create(name: "player2", position: @torp_position, h_or_m: "miss", ship: " ")
#Add position to player2's turn history
                            @turnhistory2 << @torp_position
                            board2.board.map! {|x| x == @torp_position? "[0]": x}

                        else
                          system "clear"
                          puts "<< Please enter a combination of A-T and 1-20: >>"
                        end
                      end



#Lets player choose which player list to view of the positions they have slected and if it was a hit or a miss
                when 2
                  system "clear"
                  puts "<< Enter player1 or player2 to view their score >>"
                  player = gets.chomp
                  if player.downcase == "player1"
                    @player_turns = Turn.where(name: "player1")
                    @player_turns.each do |turn|
                    puts "#{turn.position} : #{turn.h_or_m}"
                  end

                elsif player.downcase == "player2"
                    @player_turns = Turn.where(name: "player2")
                    @player_turns.each do |turn|
                    puts "#{turn.position} : #{turn.h_or_m}"
                  end
                end

# Lets the player choose which player board to view hits and misses on

                when 3
                  system "clear"
                  puts "Enter player1 or player2 to view their board"
                   board_player = gets.chomp
                    if board_player == "player1"
                      puts board1.print_board

                    elsif board_player == "player2"
                      puts board2.print_board

                    end

#Prints a battle ship and exits the program
                when 4
                  system "clear"
                  board1.battleship
                   puts "                             Until we meet again..... "
                   puts " "
                   puts " "
                   puts " "
                   exit

                else
              end
          end
end
