# frozen_string_literal: true

require 'bundler'
Bundler.require

require_relative 'lib/player'
require_relative 'lib/game'
require_relative 'lib/board'
require_relative 'lib/show'

game = Game.new

until game.is_finished?
  game.asks_whos_next
  game.shows_board
  game.makes_current_player_draw_in_cell(game.asks_which_cell)
  game.shows_board
  game.switch_player
end

game.ends_and_asks

# while game.is_ongoing?

# end