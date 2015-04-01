require 'active_record'
# require 'pry'

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


class Turn1 < ActiveRecord::Base
  has_one :player
  has_many :turns
end

class Turn2 < ActiveRecord::Base
  has_one :player
  has_many :turns
end

class Game < ActiveRecord::Base
  has_many :players
end


class CreateGame < ActiveRecord::Migration

  def initialize
    create_table :games do |column|
      column.string :winner
    end

    create_table :turn1s do |column|
      column.string :name
      column.string :position
      column.string :h_or_m
    end

    create_table :turn2s do |column|
      column.string :name
      column.string :position
      column.string :h_or_m
    end

  end

end


class Player
  attr_accessor :name, :player_num,

  def initialize name, player_num
    @name = name
    @player_num = player_num
  end

end


class Board
  attr_accessor :board, :positions, :size, :ship1, :ship2

  def initialize size
    @size = size

      loop do
      if @size == "small"
        @x = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J"]
        @y = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
        @positions = @x.product(@y)
        @board = @positions.map! {|positions| positions.join("")}

        break
      elsif @size == "large"
        @x = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T"]
        @y = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20]
        @positions = @x.product(@y)
        @largeboard = @positions.map! {|positions| positions.join("")}

        break
      else
        puts "please enter 'small' or 'large'"
        @size = gets.chomp
      end

      @positions = @x.product(@y)
      @positions = @positions.map! {|positions| positions.join("")}

    end

end


  def add_ships size
    if @size == "small"
      @ship1_ary = [["A1", "A2", "A3", "A4", "A5"]]
      @ship1_ary.shuffle!
      @ship1 = @ship1_ary[0]

      @ship2_ary = [["E7", "F7", "G7", "H7", "I7"]]
      @ship2_ary.shuffle!
      @ship2 = @ship2_ary[0]

      puts "ship1: #{@ship1}"
      puts "ship2: #{@ship2}"
    end
    # elsif @size == "large"
    #   @ship1_ary =
    #   @ship2_ary =
    #   @ship3_ary =
    #   @ship4_ary =


  end
end
