# frozen_string_literal: true

require 'bundler'
Bundler.require

require_relative 'game'

class Player
  attr_accessor :name, :number, :sign

  def initialize(sign, number)
    @sign = sign
    @number = number
  end

  def ask_name
    puts "\n\e[33mQuel est ton prénom, Joueur #{@number} ?\e[0m"
    print "\e[1m\e[33m> \e[0m"
    @name = gets.chomp
  end

  def draw_in_cell(cell)
    cell = @sign
  end
end

# draw_in_cell(board.@cases)