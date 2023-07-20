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
    puts "\n#{BRIGHT_RED}#{BOLD}#{RAPID_BLINK}Let's Fight !#{RESET}"
    @games = 0
    @current_player = @player1
    @board = Board.new
  end

  def resets_board
    @board.reset
  end

  def welcome
    puts <<-ACCUEIL

    #{BRIGHT_BLUE_BG}#{BLACK}#{BOLD}-----------------------------------------------------#{RESET}
    #{BRIGHT_BLUE_BG}#{BLACK}#{BOLD}|           Bienvenue sur 'LE MORPION' !            |#{RESET}
    #{BRIGHT_BLUE_BG}#{BLACK}#{BOLD}|    Le but du jeu est d'aligner 3 de tes signes    |#{RESET}
    #{BRIGHT_BLUE_BG}#{BLACK}#{BOLD}|     à l'horizontale, verticale ou en diagonale    |#{RESET}
    #{BRIGHT_BLUE_BG}#{BLACK}#{BOLD}-----------------------------------------------------#{RESET}
    ACCUEIL
  end

  def is_finished?
    winning_combinations = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]

    winning_combinations.each do |combination|
      if combination.all? { |i| @board.cells[i] == "X" }
        @winning_player = @player1
        return true
      elsif combination.all? { |i| @board.cells[i] == "O" }
        @winning_player = @player2
        return true
      end
    end
    return true if @board.cells.all? { |cell| /[XO]/.match?(cell) }
    return false
  end

  def asks_whos_next
    puts "\nC'est le tour de #{BOLD}#{BRIGHT_CYAN}#{@current_player.name}#{RESET}"
  end

  def shows_board
    @board.show
  end

  def asks_which_cell
    puts "\n#{BOLD}#{BRIGHT_MAGENTA}Choisis la case que tu veux cocher (entre 1 et 9)#{RESET}"
    print "#{BRIGHT_YELLOW}> #{RESET}"
    loop do
      input = gets.chomp.to_i
      if @board.cells[input - 1].match?(/[XO]/)
      puts "#{BRIGHT_RED}#{BOLD}La case est déjà prise ! Choisis en une autre#{RESET}"
      print "#{BRIGHT_YELLOW}> #{RESET}"
      elsif input.between?(1, 9)
        return input
      else
        puts "#{BRIGHT_RED}#{BOLD}Entre un chiffre entre 1 et 9.#{RESET}"
        print "#{BRIGHT_YELLOW}> #{RESET}"
      end
    end
  end

  def makes_current_player_draw_in_cell(number)
    @current_player.draws_in_cell(@board, number)
  end

  def switch_player
    @current_player = (@current_player == @player1) ? @player2 : @player1
  end

  def shows_games_played
    @games += 1
    puts "\n#{BRIGHT_YELLOW}#{@games}#{RESET} partie(s) joué(e)s"
  end

  def shows_winning_count
    puts "\n#{@player1.name} #{@player1.wins > @player2.wins ? BRIGHT_GREEN : BRIGHT_RED }#{@player1.wins}#{RESET} - #{@player2.wins > @player1.wins ? BRIGHT_GREEN : BRIGHT_RED }#{@player2.wins}#{RESET} #{@player2.name}"
  end

  def ends
    puts "\n#{BRIGHT_BLUE}#{BOLD}La partie est finie#{RESET}"
    if @winning_player == @player1
      puts "\n#{BOLD}#{BRIGHT_GREEN}#{RAPID_BLINK}#{@player1.name} a gagné#{RESET}"
      @player1.wins += 1
    elsif @winning_player == @player2
      puts "\n#{BOLD}#{BRIGHT_GREEN}#{RAPID_BLINK}#{@player2.name} a gagné#{RESET}"
      @player2.wins += 1
    else
      puts "\n#{BRIGHT_WHITE_BG}#{BLACK}#{SLOW_BLINK}MATCH NUL"
    end
  end

  def retry?
    while true
      puts "\n#{BRIGHT_MAGENTA}Veux-tu prendre ta revanche ? O/N#{RESET}"
      print "#{BRIGHT_YELLOW}> #{RESET}"
      input = gets.chomp.downcase
      case input
      when "o", "oui"
        return true
      when "n", "non"
        return false
      else
        puts "Réponds avec 'o', 'oui', 'n', ou 'non'."
      end
    end
  end
end