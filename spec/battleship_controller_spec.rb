require 'spec_helper'
require 'active_record'
require 'pry'
require_relative '../lib/battleship_models'

      describe "Battleship Board" do
        it "can be instantiated" do
          board1 = Board.new
          expect(board1.class).to be(Board)
        end
      end

      describe "a newly instantiated board" do
        let (:board) {Board.new}
          it "has an array of all board positions" do
            expect(board.board.empty?).to be_falsy
          end

          it "can have player1's ship 1 added to it" do
            board.add_ships
            expect(board.ship1.empty?).to be_falsy
          end

          it "can have player1's ship 2 added to it" do
            board.add_ships
            expect(board.ship2.empty?).to be_falsy
          end

          it "can have player1's ship 3 added to it" do
            board.add_ships
            expect(board.ship3.empty?).to be_falsy
          end

          it "can have player1's ship 4 added to it" do
            board.add_ships
            expect(board.ship4.empty?).to be_falsy
          end

          it "can have player2's ship 1 added to it" do
            board.add_ships
            expect(board.ship1_p2.empty?).to be_falsy
          end

          it "can have player2's ship 1 added to it" do
            board.add_ships
            expect(board.ship2_p2.empty?).to be_falsy
          end

          it "can have player2's ship 1 added to it" do
            board.add_ships
            expect(board.ship3_p2.empty?).to be_falsy
          end

          it "can have player2's ship 1 added to it" do
            board.add_ships
            expect(board.ship4_p2.empty?).to be_falsy
          end
        end

      describe "Turn" do
        it "can be instantiated" do
          turn = Turn.new
          expect(turn.class).to be(Turn)
        end
      end

      describe "Ship" do
        it "can be instantiated" do
          ship = Ship.new
          expect(ship.class).to be(Ship)
        end
      end

    describe "position" do

      it "is either ocean or ship"

      it "belongs to one game board"

      it "has is unique combination of row and column"

    end

    describe "player" do

      it "has a name - player1 or player2"

      it "has many turns"

        context "when playing" do

          it "has many hits"

          it "has many misses"

        end
    end

    describe "turn" do

      it "belongs to one player"

      it "belongs to one game"

      it "it has one position on the board"

      it "results in a hit or a miss"

      it "adds a tally to the total number of turns"

      it "adds a hit to the hit tally or a miss to the miss tally"

      end
