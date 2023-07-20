# frozen_string_literal: true

require 'bundler'
Bundler.require

# Requiring necessary classes for the game
require_relative 'lib/player'
require_relative 'lib/game'
require_relative 'lib/board'

# Defining the play method which drives the game
def play
  retry_flag = true # A flag that will determine if the game is to be replayed
  game = Game.new # Initializes a new game

  # The main game loop that will keep running as long as players want to replay the game
  while retry_flag
    game.reset_board # Resets the board at the start of each game

    # This loop runs for each round of the game until the game finishes
    until game.finished?
      game.ask_whos_next # Asks for the next player's turn
      game.show_board # Displays the current state of the board
      # Asks for the next move from the current player and makes that move
      game.make_current_player_draw_in_cell(game.ask_which_cell)
      game.switch_player # Switches the turn to the other player
    end

    # Once a game finishes, display the final state of the board
    game.show_board

    game.end # Ends the current game and displays the winner
    game.show_games_played # Displays the total number of games played so far
    game.show_winning_count # Displays the total number of wins for each player

    # Asks if the players want to replay the game, if they do, the main game loop will run again
    retry_flag = game.retry?
  end
end

play  # Start the game
