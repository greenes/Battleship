# Battleship
WDI Project 1 - Battleship

                    _______  _______  _______  _______  ___      _______  _______  __   __  ___   _______
                   |  _    ||   _   ||       ||       ||   |    |       ||       ||  | |  ||   | |       |
                   | |_|   ||  |_|  ||_     _||_     _||   |    |    ___||  _____||  |_|  ||   | |    _  |
                   |       ||       |  |   |    |   |  |   |    |   |___ | |_____ |       ||   | |   |_| |
                   |  _   | |       |  |   |    |   |  |   |___ |    ___||_____  ||       ||   | |    ___|
                   | |_|   ||   _   |  |   |    |   |  |       ||   |___  _____| ||   _   ||   | |   |
                   |_______||__| |__|  |___|    |___|  |_______||_______||_______||__| |__||___| |___|


User stories: https://trello.com/b/dOUo2ZXN/battleship

This program is a 2 player game of battleship.

When the player opens the game, the home screen appears and asks the player to start a new game or 
load the previous game.

When a new game is started, 2 boards are created with 4 ships placed randomly throughout each 
(two battleships of 5 consecutive spaces, one destroyer of 3 consecutive spaces, and one submarine of 2 
consecutive spaces). The player sees a menu with options to (1) Launch a torpedo (2) View scores 
(3) View the boards (4) Quit. Each player has 30 turns, if they run out, the other player wins.

When the player selects (1) player1 is prompted to launch the first torpedo. The game checks to make sure the player 
has turns left. If so, they are asked to enter a position on their board with coordinates A-T and 1-20. 
When the player enters a position, the game checks make sure the position was not already played, to see 
if it is a hit or a miss, and to make sure it is within the board. If the position was not already played, and 
is within the board, the game will return hit or miss and update the board and the database. The player will see 
"hit" or "miss" on the screen and the menu again. If the player has sunk an entire ship, they game will say "you 
sank a ship!" The next time the player chooses (1) player2 will be prompted to take a turn.

When the player selects (2) they are prompted to enter player1 or player2 to view the corresponding score. 
After entering player1 or player2 the screen will show that player's turns with the position and if it was a 
hit or a miss.

When the player selects (3) they are prompted to enter player1 or player2 to view the corresponding board. 
After entering player1 or player2 the screen will show the game board with all the positions and "[x]"'s where 
they have made hits, and "[0]"'s where they have missed.

When the player selects (4) the player sees a battleship and the program closes.

There is no seed data for this program because either a new game is started, with no turns taken by either player yet, or the previous game is loaded, for which there are specific turns made by each person.
