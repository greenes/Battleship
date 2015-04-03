require 'active_record'
require 'pry'

    ActiveRecord::Base.establish_connection(
      :adapter => "postgresql",
      :host	=> "localhost",
      :database => "battleship"
    )

      def clean_as_a_whistle
        ActiveRecord::Base.connection.tables.each do |table|
          ActiveRecord::Base.connection.drop_table(table)
        end
      end


      class Turn < ActiveRecord::Base
        has_one :player
        # has_one :ship
        # validations :position, :h_or_m, :name, presence: true
      end

      class Ship < ActiveRecord::Base
        belongs_to :turn
        serialize :array
      end


  class CreateGame < ActiveRecord::Migration

            def initialize
              create_table :turns do |column|
                # column.belongs_to :ships
                column.string :name
                column.string :position
                column.string :h_or_m
                column.string :ship
              end

              create_table :ships do |column|
                # column.belongs_to :turns
                column.string :name
                column.string :array
            end
          end

  end


class Board
  attr_accessor :board, :positions, :ship1, :ship2, :ship3, :ship4, :ship1_p2, :ship2_p2, :ship3_p2, :ship4_p2

  def initialize

        @x = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T"]
        @y = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20]
        @positions = @x.product(@y)
        @board = @positions.map! {|positions| positions.join("")}
      end


        def print_board
          puts @board[0..19].join("  ")
          puts @board[20..39].join("  ")
          puts @board[40..59].join("  ")
          puts @board[60..79].join("  ")
          puts @board[80..99].join("  ")
          puts @board[100..119].join("  ")
          puts @board[120..139].join("  ")
          puts @board[140..159].join("  ")
          puts @board[160..179].join("  ")
          puts @board[180..199].join("  ")
          puts @board[200..219].join("  ")
          puts @board[220..239].join("  ")
          puts @board[240..259].join("  ")
          puts @board[260..279].join("  ")
          puts @board[280..299].join("  ")
          puts @board[300..319].join("  ")
          puts @board[320..339].join("  ")
          puts @board[340..359].join("  ")
          puts @board[360..379].join("  ")
          puts @board[380..399].join("  ")

        end


  def add_ships

      @ship1_ary = [["A1", "A2", "A3", "A4", "A5"], ["B2", "B3", "B4", "B5", "B6"],
      ["B9", "B10", "B11", "B12", "B13"], ["C2", "C3", "C4", "C5", "C6"], ["C10", "C11", "C12", "C13", "C14"],
      ["G8", "G9", "G10", "G11", "G12"], ["J10", "J11", "J12", "J13", "J14"], ["M5", "M6", "M7", "M8", "M9"]]
      @ship1_ary.shuffle!
      @ship1 = @ship1_ary[0]

      @ship2_ary = [["E7", "F7", "G7", "H7", "I7"], ["B2", "C2", "D2", "E2", "F2"], ["G9", "H9", "I9", "J9", "K9"],
      ["J15", "K15", "L15", "M15", "N15"], ["P19", "Q19", "R19", "S19", "T19"], ["D7", "E7", "F7", "G7", "H7"]]
      @ship2_ary.shuffle!
      @ship2 = @ship2_ary[0]

      @ship3_ary = [["S6", "S7", "S8"], ["S1", "S2", "S3"], ["S4", "S5", "S6"], ["S9", "S10", "S11"], ["S13", "S14", "S15"],
      ["S17", "S18", "S19"], ["M1", "M2", "M3"], ["M10", "M11", "M12"], ["M12", "M13", "M14"], ["A6", "A7", "A8"], ["A9", "A10", "A11"],
      ["A12", "A13", "A14"], ["A15", "A16", "A17"], ["A18", "A19", "A20"]]
      @ship3_ary.shuffle!
      @ship3 = @ship3_ary[0]

      @ship4_ary = [["N1", "O1"], ["B6", "C6"], ["T1", "T2"], ["T11", "T12"], ["Q8", "R8"], ["P19", "P20"], ["B7, B8"]]
      @ship4_ary.shuffle!
      @ship4 = @ship4_ary[0]

      @ship1_ary_p2 = [["A1", "A2", "A3", "A4", "A5"], ["B2", "B3", "B4", "B5", "B6"],
      ["B9", "B10", "B11", "B12", "B13"], ["C2", "C3", "C4", "C5", "C6"], ["C10", "C11", "C12", "C13", "C14"],
      ["G8", "G9", "G10", "G11", "G12"], ["J10", "J11", "J12", "J13", "J14"], ["M5", "M6", "M7", "M8", "M9"]]
      @ship1_ary_p2.shuffle!
      @ship1_p2 = @ship1_ary_p2[0]

      @ship2_ary_p2 = [["E7", "F7", "G7", "H7", "I7"], ["B2", "C2", "D2", "E2", "F2"], ["G9", "H9", "I9", "J9", "K9"],
      ["J15", "K15", "L15", "M15", "N15"], ["P19", "Q19", "R19", "S19", "T19"], ["D7", "E7", "F7", "G7", "H7"]]
      @ship2_ary_p2.shuffle!
      @ship2_p2 = @ship2_ary_p2[0]

      @ship3_ary_p2 = [["S6", "S7", "S8"], ["S1", "S2", "S3"], ["S4", "S5", "S6"], ["S9", "S10", "S11"], ["S13", "S14", "S15"],
      ["S17", "S18", "S19"], ["M1", "M2", "M3"], ["M10", "M11", "M12"], ["M12", "M13", "M14"], ["A6", "A7", "A8"], ["A9", "A10", "A11"],
      ["A12", "A13", "A14"], ["A15", "A16", "A17"], ["A18", "A19", "A20"]]
      @ship3_ary_p2.shuffle!
      @ship3_p2 = @ship3_ary_p2[0]

      @ship4_ary_p2 =  [["N1", "O1"], ["B6", "C6"], ["T1", "T2"], ["T11", "T12"], ["Q8", "R8"], ["P19", "P20"], ["B7, B8"], ["H19", "H20"],
      ["H17", "H18"]]
      @ship4_ary_p2.shuffle!
      @ship4_p2 = @ship4_ary_p2[0]

end

      def battleship
        system "clear"
        puts "                               |__"
        puts "                               |\\/"
        puts "                                ---"
        puts "                              / | ["
        puts "                         !      | |||"
        puts "                       _/|     _/|-++'"
        puts "                   +  +--|    |--|--|_ |-"
        puts "                      { /|__|  |/\\__|  |--- |||__/"
        puts "                     +---------------___[}-_===_.'____               /\\"
        puts "                  ____`-' ||___-{]_| _[}-  |     |_[___\==--          \\/   _"
        puts "       __..._____--==/___]_|__|_____________________________[___\==--____,------' .7"
        puts "      |                                                                     BB-61/"
        puts "      \\_________________________________________________________________________|"
      end

      def hit
        puts "                          ..-^~~~^-.."
        puts "                        .~           ~."
        puts "                       (;:           :;)"
        puts "                        (:           :)"
        puts "                          ':._   _.:'"
        puts "                              | |"
        puts "                            (=====)"
        puts "                              | |"
        puts "                              | |"
        puts "                              | |"
        puts "                           ((/  \\))"
        puts "                           <<HIT!>>"
      end

end


def load_turns
  Turn.create(ships_id: 4, name: "player1", position: "D4", h_or_m: "HIT")

end


# binding.pry
