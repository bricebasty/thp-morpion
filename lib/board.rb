# frozen_string_literal: true

require 'bundler'
Bundler.require

require_relative 'game'

# Class representing the game board for Tic Tac Toe
class Board
  attr_accessor :cells # Accessor for the cells array representing the board

  # Initializes a new board with cells numbered 1-9
  def initialize
    @cells = Array.new(9) { |i| (i + 1).to_s }
  end

  # Resets the board to its initial state
  def reset
    @cells = Array.new(9) { |i| (i + 1).to_s }
  end

  # Updates a specific cell on the board with a player's marker
  def update_cell(number, sign)
    @cells[number - 1] = sign
  end

  # Prints the board to the console with colorful markers and cell numbers
  def show
    # Print the board to the console
    puts [top_line, formatted_rows.join("\n#{horizontal_separator}\n"), bottom_line].join("\n")
  end

  def top_line
    '┌─────────┬─────────┬─────────┐'
  end

  def bottom_line
    '└─────────┴─────────┴─────────┘'
  end

  def horizontal_separator
    '├─────────┼─────────┼─────────┤'
  end

  def formatted_rows
    # Initialize rows array to hold formatted rows
    rows = []

    # Construct each row in the board
    3.times do |r|
      cells = [] # Initialize cells array to hold the cells in the current row

      # Construct each cell in the current row
      3.times do |c|
        cells << cell_output(r, c) # Get the corresponding colored console output
      end

      # Add the formatted row to the rows array
      rows << cells.transpose.map { |row| "│ #{row.join(' │ ')} │" }.join("\n")
    end

    rows
  end

  def cell_output(row, column)
    cell_value = @cells[row * 3 + column] # Get the current cell's value
    mappings[cell_value]
  end

  def mappings
    # Mapping of cell values to their colored console output
    { 'X' => [" #{BRIGHT_RED}\\   /#{RESET} ", "  #{BRIGHT_RED}>-<#{RESET}  ", " #{BRIGHT_RED}/   \\#{RESET} "],
      'O' => ["  #{BRIGHT_GREEN}---#{RESET}  ", " #{BRIGHT_GREEN}|   |#{RESET} ", "  #{BRIGHT_GREEN}---#{RESET}  "],
      '1' => ['       ', "   #{BRIGHT_YELLOW}1#{RESET}   ", '       '],
      '2' => ['       ', "   #{BRIGHT_YELLOW}2#{RESET}   ", '       '],
      '3' => ['       ', "   #{BRIGHT_YELLOW}3#{RESET}   ", '       '],
      '4' => ['       ', "   #{BRIGHT_YELLOW}4#{RESET}   ", '       '],
      '5' => ['       ', "   #{BRIGHT_YELLOW}5#{RESET}   ", '       '],
      '6' => ['       ', "   #{BRIGHT_YELLOW}6#{RESET}   ", '       '],
      '7' => ['       ', "   #{BRIGHT_YELLOW}7#{RESET}   ", '       '],
      '8' => ['       ', "   #{BRIGHT_YELLOW}8#{RESET}   ", '       '],
      '9' => ['       ', "   #{BRIGHT_YELLOW}9#{RESET}   ", '       '] }
  end
end
