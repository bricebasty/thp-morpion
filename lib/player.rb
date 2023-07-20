# frozen_string_literal: true

require 'bundler'
Bundler.require

require_relative 'game'
require_relative 'colors'

# Class representing a Player in the game of Tic Tac Toe
class Player
  attr_accessor :name, :number, :sign, :wins # Attributes representing player's name, number, sign, and wins

  # Initializes a new Player with a number and a sign (either 'X' or 'O')
  def initialize(number, sign)
    @number = number
    @sign = sign
    @wins = 0 # Start with 0 wins
  end

  # Asks the Player for their name and prints a greeting message
  def ask_name
    puts "\nQuel est ton prénom, #{BOLD}#{BRIGHT_CYAN}Joueur #{@number} #{BRIGHT_WHITE}?#{RESET}"
    print "#{BOLD}#{YELLOW}> #{RESET}"
    @name = gets.chomp # Reads the player's input from the console
    greeting = "\nBienvenue #{BOLD}#{BRIGHT_CYAN}#{@name}#{RESET}"
    sign = "#{BOLD}#{@sign == 'X' ? BRIGHT_RED : BRIGHT_GREEN}#{@sign}#{RESET}"
    puts "#{greeting}, ton signe est #{sign}"
  end

  # Draws the Player's sign in a cell on the board
  def draws_in_cell(board, number)
    board.update_cell(number, @sign)
  end
end
