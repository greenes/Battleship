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
  has_many :players
  # validations :position, uniqueness: true
end


class CreateGame < ActiveRecord::Migration

  def initialize
    create_table :turns do |column|
      column.string :name
      column.string :position
      column.string :h_or_m
    end

  end

end


class Board
  attr_accessor :board, :positions, :num_players, :ship1, :ship2, :ship3, :ship4

  def initialize
    @num_players = num_players

        @x = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T"]
        @y = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20]
        @positions = @x.product(@y)
      end


        def print_board
          @board = @positions.map! {|positions| positions.join("")}
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

      @ship3_ary = [["S6", "S7", "S8"]]
      @ship3_ary.shuffle!
      @ship3 = @ship3_ary[0]

      @ship4_ary = [["N1", "O1"]]
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

      @ship3_ary_p2 = [["S6", "S7", "S8"]]
      @ship3_ary_p2.shuffle!
      @ship3_p2 = @ship3_ary_p2[0]

      @ship4_ary_p2 = [["N1", "O1"]]
      @ship4_ary_p2.shuffle!
      @ship4_p2 = @ship4_ary_p2[0]

      puts "ship1: #{@ship1}"
      puts "ship2: #{@ship2}"
      puts "ship3: #{@ship3}"
      puts "ship4: #{@ship4}"

end
end

# binding.pry
