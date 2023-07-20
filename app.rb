# frozen_string_literal: true

require 'bundler'
Bundler.require

require_relative 'lib/player'
require_relative 'lib/game'
require_relative 'lib/board'

def play
  retry_flag = true
  game = Game.new
  while retry_flag
    game.resets_board
    until game.is_finished?
      game.asks_whos_next
      game.shows_board
      game.makes_current_player_draw_in_cell(game.asks_which_cell)
      game.switch_player
    end

    game.shows_board
    game.ends
    game.shows_games_played
    game.shows_winning_count
    retry_flag = game.retry?
  end
end

play
# while game.is_ongoing?

# end