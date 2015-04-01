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


class Player1 < ActiveRecord::Base
  has_many :turns
end

class Player2 < ActiveRecord::Base
  has_many :turns
end

class Turn < ActiveRecord::Base
  has_many :players
end


class CreateGame < ActiveRecord::Migration

  def initialize
    create_table :turns do |column|
      column.string :name
      column.string :position
      column.string :h_or_m
    end

    create_table :players do |column|
      column.string :name
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


        def print_board2
          @board2 = @positions.map! {|positions| positions.join("")}
           puts @board2[0..19].join("  ")
           puts @board2[20..39].join("  ")
           puts @board2[40..59].join("  ")
           puts @board2[60..79].join("  ")
           puts @board2[80..99].join("  ")
           puts @board2[100..119].join("  ")
           puts @board2[120..139].join("  ")
           puts @board2[140..159].join("  ")
           puts @board2[160..179].join("  ")
           puts @board2[180..199].join("  ")
           puts @board2[200..219].join("  ")
           puts @board2[220..239].join("  ")
           puts @board2[240..259].join("  ")
           puts @board2[260..279].join("  ")
           puts @board2[280..299].join("  ")
           puts @board2[300..319].join("  ")
           puts @board2[320..339].join("  ")
           puts @board2[340..359].join("  ")
           puts @board2[360..379].join("  ")
           puts @board2[380..399].join("  ")
         end
       end


  def add_ships

      @ship1_ary = [["A1", "A2", "A3", "A4", "A5"]]
      @ship1_ary.shuffle!
      @ship1 = @ship1_ary[0]

      @ship2_ary = [["E7", "F7", "G7", "H7", "I7"]]
      @ship2_ary.shuffle!
      @ship2 = @ship2_ary[0]

      @ship3_ary = [["S6", "S7", "S8"]]
      @ship3_ary.shuffle!
      @ship3 = @ship3_ary[0]

      @ship4_ary = [["N1", "O1"]]
      @ship4_ary.shuffle!
      @ship4 = @ship4_ary[0]

      puts "ship1: #{@ship1}"
      puts "ship2: #{@ship2}"
      puts "ship3: #{@ship3}"
      puts "ship4: #{@ship4}"

end
end


#
# binding.pry
