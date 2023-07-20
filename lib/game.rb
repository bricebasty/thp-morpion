# frozen_string_literal: true

require 'bundler'
Bundler.require

require_relative 'player'
require_relative 'board'



class Game
  attr_accessor :player1, :player2, :board

  def initialize
    (@player1 = Player.new('X', 1)).ask_name
    (@player2 = Player.new('O', 2)).ask_name

    @board = Board.new()
  end

  def is_ongoing?
    @board.cells.all? { |cell| /[XO]/.match?(cell) }
  end

  def whose_turn
    puts "C'est le tour de "
  end

  def end_retry
    puts "La partie est finie"
    puts @player1.has_won? ? "Le joueur #{@player1.name} a gagné" : "Le joueur #{@player2.name} a gagné"
  end
end