# frozen_string_literal: true

require 'bundler'
Bundler.require

class Board
  attr_accessor :cells

  def initialize
    @cells = Array.new(9, " ")
  end

  def show
    @cells.each_slice(3) { |row| puts row.join }
  end

  def update_cell(n, sign)
    @cells[n - 1] = sign
  end
end
