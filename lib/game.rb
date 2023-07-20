# frozen_string_literal: true

require 'bundler'
Bundler.require

require_relative 'player'
require_relative 'board'
require_relative 'colors'

class Game
  attr_accessor :player1, :player2, :turn

  def initialize
    welcome
    (@player1 = Player.new(1, 'X')).ask_name
    (@player2 = Player.new(2, 'O')).ask_name
    puts "\n#{RED}#{BOLD}#{RAPID_BLINK}Let's Fight !#{RESET}"

    @current_player = @player1
    @winning_play
    @board = Board.new
  end

  def welcome
    puts <<-ACCUEIL

    #{BLUE_BG}#{BLACK}#{BOLD}-----------------------------------------------------#{RESET}
    #{BLUE_BG}#{BLACK}#{BOLD}|           Bienvenue sur 'LE MORPION' !            |#{RESET}
    #{BLUE_BG}#{BLACK}#{BOLD}|    Le but du jeu est d'aligner 3 de tes signes    |#{RESET}
    #{BLUE_BG}#{BLACK}#{BOLD}|     à l'horizontale, verticale ou en diagonale    |#{RESET}
    #{BLUE_BG}#{BLACK}#{BOLD}-----------------------------------------------------#{RESET}
    ACCUEIL
  end

  def is_finished?
    @board.cells.all? { |cell| /[XO]/.match?(cell) }

  end

  def asks_whos_next
    puts "\nC'est le tour de #{BOLD}#{RED}#{@current_player.name}#{RESET}"
  end

  def shows_board
    @board.show
  end

  def asks_which_cell
    puts "\n#{BOLD}Choisis la case que tu veux cocher :#{RESET}"
    print "#{YELLOW}> #{RESET}"
    loop do
      input = gets.chomp.to_i
      if @board.cells[input - 1].match?(/[XO]/)
      puts "#{RED}#{BOLD}La case est déjà prise ! Choisis en une autre#{RESET}"
      print "#{YELLOW}> #{RESET}"
      elsif input.between?(1, 9)
        return input
      else
        puts "#{RED}#{BOLD}Entre un chiffre entre 1 et 9.#{RESET}"
        print "#{YELLOW}> #{RESET}"
      end
    end
  end

  def makes_current_player_draw_in_cell(number)
    @current_player.draws_in_cell(@board, number)
  end

  def switch_player
    @current_player = (@current_player == @player1) ? @player2 : @player1
  end

  def ends_and_asks
    puts "\nLa partie est finie"
    if @player1.has_won?
      puts "\nLe joueur #{BOLD}#{GREEN}#{@player1.name} #{RESET}a gagné"
      @player1.wins += 1
    elsif @player2.has_won?
      puts "\nLe joueur #{BOLD}#{GREEN}#{@player2.name} #{RESET}a gagné"
      @player2.wins += 1
    else
      puts "\n#{WHITE_BG}#{BLACK}MATCH NUL"
    end
  end
end