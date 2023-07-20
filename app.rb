# frozen_string_literal: true

require 'bundler'
Bundler.require

require_relative 'lib/player'
require_relative 'lib/game'
require_relative 'lib/board'
require_relative 'lib/show'

def welcome
  puts <<-ACCUEIL
  \e[46m\e[30m\e[1m-----------------------------------------------------\e[0m
  \e[46m\e[30m\e[1m|           Bienvenue sur 'LE MORPION' !            |\e[0m
  \e[46m\e[30m\e[1m|    Le but du jeu est d'aligner 3 de tes signes    |\e[0m
  \e[46m\e[30m\e[1m|     à l'horizontale, verticale ou en diagonale    |\e[0m
  \e[46m\e[30m\e[1m-----------------------------------------------------\e[0m
  ACCUEIL
end

welcome
game = Game.new


# while game.is_ongoing?

# end