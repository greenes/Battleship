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

          board1 = Board.new
          board1.add_ships
          board2 = Board.new
          board2.add_ships
          system "clear"
          board1.print_board



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
    last_turn = Turn.last
    if last_turn == nil || last_turn.name == "player2"

      system "clear"
      puts "Player1 turn"

    if @turnhistory.count == 5
      system "clear"
      puts "<< You have no torpedos left. Player2 WINS! >>"
    end

    puts "<< Select position (row A-T and a column 1-20) to aim your torpedo at: >>"
        @torp_position = gets.chomp.to_s

#checks to see if the position was already played
        if @turnhistory.include?(@torp_position)
          puts "<< You have already sent a torpedo there >>"

#if not, goes ahead and checks to see if it is a hit
        elsif
            if board1.ship1.include?(@torp_position) == true
              system "clear"
              puts "<< launching torpedo..............."
              puts "        ~~     (/_____________________"
              puts "     ~~~~     <))_____________________}"
              puts "       ~~~     (/   "
              sleep 1
              system "clear"
              puts "      ..-^~~~^-.."
              puts "    .~           ~."
              puts "   (;:           :;)"
              puts "    (:           :)"
              puts "      ':._   _.:'"
              puts "          | |"
              puts "        (=====)"
              puts "          | |"
              puts "          | |"
              puts "          | |"
              puts "       ((/  \\))"
              puts "        <<HIT!>>"
              @ship1_hits << @torp_position
            elsif board1.ship2.include?(@torp_position) == true
              system "clear"
              puts "<< launching torpedo..............."
              puts "        ~~     (/_____________________"
              puts "     ~~~~     <))_____________________}"
              puts "       ~~~     (/   "
              sleep 1
              system "clear"
              puts "      ..-^~~~^-.."
              puts "    .~           ~."
              puts "   (;:           :;)"
              puts "    (:           :)"
              puts "      ':._   _.:'"
              puts "          | |"
              puts "        (=====)"
              puts "          | |"
              puts "          | |"
              puts "          | |"
              puts "       ((/  \\))"
              puts "        <<HIT!>>"
              @ship2_hits << @torp_position
            elsif board1.ship3.include?(@torp_position) == true
              system "clear"
              puts "launching torpedo..............."
              puts "        ~~     (/_____________________"
              puts "     ~~~~     <))_____________________}"
              puts "       ~~~     (/   "
              sleep 1
              system "clear"
              puts "      ..-^~~~^-.."
              puts "    .~           ~."
              puts "   (;:           :;)"
              puts "    (:           :)"
              puts "      ':._   _.:'"
              puts "          | |"
              puts "        (=====)"
              puts "          | |"
              puts "          | |"
              puts "          | |"
              puts "       ((/  \\))"
              puts "        <<HIT!>>"
              @ship3_hits << @torp_position
            elsif board1.ship4.include?(@torp_position)== true
              system "clear"
              puts "launching torpedo..............."
              puts "        ~~     (/_____________________"
              puts "     ~~~~     <))_____________________}"
              puts "       ~~~     (/   "
              sleep 1
              system "clear"
              puts "      ..-^~~~^-.."
              puts "    .~           ~."
              puts "   (;:           :;)"
              puts "    (:           :)"
              puts "      ':._   _.:'"
              puts "          | |"
              puts "        (=====)"
              puts "          | |"
              puts "          | |"
              puts "          | |"
              puts "       ((/  \\))"
              puts "        <<HIT!>>"
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
                  puts "<< YOU SANK ALL ENEMY BATTLESHIPS! Player1 Wins! >>"
                  exit

              end

#checks to see make sure the position is within the board and returns a miss
            elsif board1.board.include?(@torp_position) == true
              system "clear"
              puts "launching torpedo..............."
              puts "        ~~     (/_____________________"
              puts "     ~~~~     <))_____________________}"
              puts "       ~~~     (/   "
              sleep 1
              system "clear"
              puts ")`'-.,_)`'-.,_)`'-.,_)`'-.,_)`'-.,_)`'-.,_)`'-.,_)`'-.,_"
              puts "                       << miss >>"
              Turn.create(name: "player1", position: @torp_position, h_or_m: "miss")
              @turnhistory << @torp_position
              board1.board.map! {|x| x == @torp_position? " O ": x}

            else
              puts "<< Please enter a combination of A-T and 1-20: >>"
            end



      elsif last_turn.name == "player1"
        system "clear"
        puts "Player2 turn"

    # Asks the user to enter a positions and returns a hit or a miss

        if @turnhistory2.count == 5
          puts "<< You have no torpedos left. Player1 WINS! >>"
          exit
        end

        puts "<< Select position (row A-T and a column 1-20) to aim your torpedo at: >>"
            @torp_position = gets.chomp.to_s

    #checks to see if the position was already played
            if @turnhistory2.include?(@torp_position)
              puts "<< You have already sent a torpedo there >>"

    #if not, goes ahead and checks to see if it is a hit
            elsif
                if board2.ship1_p2.include?(@torp_position) == true
                  system "clear"
                  puts "launching torpedo..............."
                  puts "        ~~     (/_____________________"
                  puts "     ~~~~     <))_____________________}"
                  puts "       ~~~     (/   "
                  sleep 1
                  system "clear"
                  puts "      ..-^~~~^-.."
                  puts "    .~           ~."
                  puts "   (;:           :;)"
                  puts "    (:           :)"
                  puts "      ':._   _.:'"
                  puts "          | |"
                  puts "        (=====)"
                  puts "          | |"
                  puts "          | |"
                  puts "          | |"
                  puts "       ((/  \\))"
                  puts "        <<HIT!>>"
                  @ship1_hits2 << @torp_position
                elsif board2.ship2_p2.include?(@torp_position) == true
                  system "clear"
                  puts "launching torpedo..............."
                  puts "        ~~     (/_____________________"
                  puts "     ~~~~     <))_____________________}"
                  puts "       ~~~     (/   "
                  sleep 1
                  system "clear"
                  puts "      ..-^~~~^-.."
                  puts "    .~           ~."
                  puts "   (;:           :;)"
                  puts "    (:           :)"
                  puts "      ':._   _.:'"
                  puts "          | |"
                  puts "        (=====)"
                  puts "          | |"
                  puts "          | |"
                  puts "          | |"
                  puts "       ((/  \\))"
                  puts "        <<HIT!>>"
                  @ship2_hits2 << @torp_position
                elsif board2.ship3_p2.include?(@torp_position) == true
                  system "clear"
                  puts "launching torpedo..............."
                  puts "        ~~     (/_____________________"
                  puts "     ~~~~     <))_____________________}"
                  puts "       ~~~     (/   "
                  sleep 1
                  system "clear"
                  puts "      ..-^~~~^-.."
                  puts "    .~           ~."
                  puts "   (;:           :;)"
                  puts "    (:           :)"
                  puts "      ':._   _.:'"
                  puts "          | |"
                  puts "        (=====)"
                  puts "          | |"
                  puts "          | |"
                  puts "          | |"
                  puts "       ((/  \\))"
                  puts "        <<HIT!>>"
                  @ship3_hits2 << @torp_position
                elsif board2.ship4_p2.include?(@torp_position)== true
                  system "clear"
                  puts "launching torpedo..............."
                  puts "        ~~     (/_____________________"
                  puts "     ~~~~     <))_____________________}"
                  puts "       ~~~     (/   "
                  sleep 1
                  system "clear"
                  puts "      ..-^~~~^-.."
                  puts "    .~           ~."
                  puts "   (;:           :;)"
                  puts "    (:           :)"
                  puts "      ':._   _.:'"
                  puts "          | |"
                  puts "        (=====)"
                  puts "          | |"
                  puts "          | |"
                  puts "          | |"
                  puts "       ((/  \\))"
                  puts "        <<HIT!>>"
                  @ship4_hits2 << @torp_position
                end

                  @turnhistory2 << @torp_position
                  @hitcounter2 << @torp_position

                    board2.board.map! {|x| x == @torp_position? " X": x}

    #adds the turn as a hit to the player1s database
                    Turn.create(name: "player2", position: @torp_position, h_or_m: "HIT")

    #checks to see if a full ship has been sunk
                    if @ship1_hits2.count == 5 || @ship2_hits2.count == 5 || @ship3_hits2.count == 3 || @ship4_hits2.count == 2
                        puts "<< YOU SANK A SHIP! >>"

    #checks to see if all ships have been sunk
                    elsif @turnhistory2.count == 15
                        puts "<< YOU SANK ALL ENEMY BATTLESHIPS! Player2 Wins! >>"
                        exit

                    end

    #checks to see make sure the position is within the board and returns a miss
                  elsif board2.board.include?(@torp_position) == true
                    system "clear"
                    puts "launching torpedo..............."
                    puts "        ~~     (/_____________________"
                    puts "     ~~~~     <))_____________________}"
                    puts "       ~~~     (/   "
                  sleep 1
                  system "clear"
                  puts ")`'-.,_)`'-.,_)`'-.,_)`'-.,_)`'-.,_)`'-.,_)`'-.,_)`'-.,_"
                  puts "                    << miss >>"
                  Turn.create(name: "player2", position: @torp_position, h_or_m: "miss")
                  @turnhistory2 << @torp_position
                  board2.board.map! {|x| x == @torp_position? " O ": x}

                else
                  puts "<< Please enter a combination of A-T and 1-20: >>"
                end
              end



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
              puts board1.print_board

            elsif board_player == "player2"
              puts board2.print_board

            end



        when 4
          puts "<< Until we meet again! >>"
          exit

        else
      end
  end
end
