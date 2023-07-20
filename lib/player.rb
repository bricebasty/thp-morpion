# frozen_string_literal: true

require 'bundler'
Bundler.require

require_relative 'game'
require_relative 'colors'

class Player
  attr_accessor :name, :number, :sign, :wins

  def initialize(number, sign)
    @number = number
    @sign = sign
    @wins = 0
  end

  def ask_name
    puts "\nQuel est ton prénom, #{BOLD}#{GREEN}Joueur #{@number} #{WHITE}?#{RESET}"
    print "#{BOLD}#{YELLOW}> #{RESET}"
    @name = gets.chomp
    puts "\nTrès bien #{BOLD}#{CYAN}#{@name}#{RESET}, ton signe est #{BOLD}#{RED}#{@sign}#{RESET}"
  end

  def has_won?

  end

  def draws_in_cell(board, number)
    board.update_cell(number, @sign)
  end
end
