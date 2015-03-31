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
  has_one :position
  validates :postion, :uniqueness => true
end

class Game < ActiveRecord::Base
  has_many :players
end

class Player < ActiveRecord::Base
  has_many :turns
end


class CreateGame < ActiveRecord::Migration

  def initialize
    create_table :games do |column|
      column.belongs_to :player
      column.boolean :win_or_lose
    end

    create_table :turns do |column|
      column.belongs_to :game
      column.belongs_to :player
      column.string :position
      column.boolean :hit_or_miss
    end

    create_table :players do |column|
      column.string :name
    end
  end

end

binding.pry

# class Board
#   attr_accessor :board, :positions, :size, :ship1, :ship2
#
#   def initialize size
#     @size = size
#
#       loop do
#       if @size == "small"
#         @rows = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J"]
#         @columns = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
#         break
#       elsif @size == "large"
#         @rows = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T"]
#         @columns = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20]
#         break
#       else
#         puts "please enter 'small' or 'large'"
#         @size = gets.chomp
#       end
#     end
#     @positions = @rows.product(@columns)
#       @board = @positions.map {|position| position.join("")}
#   end
#
#
#   def add_ships
#     if @size == "small"
#       @board.map_with_index {|x| {x: false}}
#       @board.shuffle!
#       puts @board[0][]
#       puts @board[1]
#     end
#   end
#
# end
