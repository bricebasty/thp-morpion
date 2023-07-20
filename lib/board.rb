# frozen_string_literal: true

require 'bundler'
Bundler.require

require_relative 'game'

class Board
  attr_accessor :cells

  def initialize
    @cells = Array.new(9) { |i| (i + 1).to_s }
  end

  def reset
    @cells = Array.new(9) { |i| (i + 1).to_s }
  end

  def update_cell(n, sign)
    @cells[n - 1] = sign
  end

  def show
    mappings = { 'X' => [" #{BRIGHT_RED}\\   /#{RESET} ", "  #{BRIGHT_RED}>-<#{RESET}  ", " #{BRIGHT_RED}/   \\#{RESET} "],
                 'O' => ["  #{BRIGHT_GREEN}---#{RESET}  ", " #{BRIGHT_GREEN}|   |#{RESET} ",
                         "  #{BRIGHT_GREEN}---#{RESET}  "],
                 '1' => ['       ', "   #{BRIGHT_YELLOW}1#{RESET}   ", '       '],
                 '2' => ['       ', "   #{BRIGHT_YELLOW}2#{RESET}   ", '       '],
                 '3' => ['       ', "   #{BRIGHT_YELLOW}3#{RESET}   ", '       '],
                 '4' => ['       ', "   #{BRIGHT_YELLOW}4#{RESET}   ", '       '],
                 '5' => ['       ', "   #{BRIGHT_YELLOW}5#{RESET}   ", '       '],
                 '6' => ['       ', "   #{BRIGHT_YELLOW}6#{RESET}   ", '       '],
                 '7' => ['       ', "   #{BRIGHT_YELLOW}7#{RESET}   ", '       '],
                 '8' => ['       ', "   #{BRIGHT_YELLOW}8#{RESET}   ", '       '],
                 '9' => ['       ', "   #{BRIGHT_YELLOW}9#{RESET}   ", '       '] }

    rows = []
    3.times do |r|
      cells = []
      3.times do |c|
        cell_value = @cells[r * 3 + c] # changed this line
        cells << mappings[cell_value]
      end

      rows << cells.transpose.map { |row| "│ #{row.join(' │ ')} │" }.join("\n")
    end

    horizontal_separator = '├─────────┼─────────┼─────────┤'
    top_line = '┌─────────┬─────────┬─────────┐'
    bottom_line = '└─────────┴─────────┴─────────┘'

    puts [top_line, rows.join("\n#{horizontal_separator}\n"), bottom_line].join("\n")
  end
end
